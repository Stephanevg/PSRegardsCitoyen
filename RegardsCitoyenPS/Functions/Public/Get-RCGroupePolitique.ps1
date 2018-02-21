
Function Get-RCGroupePolitique {
    [CmdletBinding(DefaultParameterSetName="all")]
    Param(

        [Parameter(Mandatory=$false,ParameterSetName="get")]
        [Parti]$Nom,

        #bug: nom should be mandatory when ListMembers is called
        [Parameter(Mandatory=$false,ParameterSetName="get")]
        [Switch]$ListMembres
    )

    switch ($PSCmdlet.ParameterSetName) {
        "get" {
            
            #I had to use this construct since having two parametersetnames seemed to simply not wanting to work.
            if ($ListMembres){
                write-verbose "[MEMBRES]Telechargement des données depuis internet..."
                $url = ($RC_Data.Urls.groupepolitique).Replace("/json",("/" + $Nom.ToString() + "/json"))
                $data = (invoke-restmethod -Uri $url).deputes
                Foreach ($entry in $Data.depute){
                    #Depute([int]$id,[String]$Nom,[String]$Prenom,[String]$Groupe,[DateTime]$DateNaissance,[String]$LieuNaissance,[Sexe]$Sexe,[string]$nomcirco,[int]$numcirco,[int]$PlaceHemicylce,[DateTime]$DebutDeMandat,[String]$Profession,[string]$Twitter,[int]$NbMandats,[string]$partirattfinancier,[Mandat[]]$autresmandats,[string[]]$Collaborateurs,[string[]]$Emails){
                        $Collaborateurs = @()
                        foreach ($col in $entry.Collaborateurs.Collaborateur){
                                $Collaborateurs += $col
                        }
        
                        $autresmandats = @()
                        foreach ($autreMandat in $entry.autres_mandats.mandat){
                                $mandat = ""
                                $mandat = $autreMandat.replace(" ","").split("/")
                                if ($mandat){
                                    $autresmandats += [Mandat]::New($mandat[0],$mandat[1],$mandat[2])
        
                                }
                        }
        
                        $Emails = @()
                        foreach ($mail in $entry.emails.email){
                                $Emails += $mail
                        }
        
                        [Depute]::New($entry.id,$entry.nom_de_famille,$entry.prenom,$entry.groupe_sigle,$entry.date_naissance,$entry.lieu_naissance,$entry.sexe,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$entry.profession,$entry.twitter,$entry.nb_mandats,$entry.parti_ratt_financier,$autresmandats,$Collaborateurs,$Emails)
                        #[Depute]::New($entry.id,$entry.nom_de_famille,$entry.prenom,$entry.groupe_sigle,$entry.date_naissance,$entry.lieu_naissance,$entry.sexe,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$entry.profession,$entry.twitter,$entry.nb_mandats,$entry.parti_ratt_financier)
                }
                break;
            }else{
                write-verbose "[GET]Telechargement des données depuis internet..."
                $url = ($RC_Data.Urls.organisme)
                $all = (invoke-restmethod -Uri $url).organismes.organisme
                $fro = $all | ? {$_.acronyme -eq $Nom}
                [GroupePolitique]::new($fro.id,$fro.slug,$fro.nom,$fro.acronyme,$fro.groupe_actuel,$fro.couleur,$fro.order,$fro.type,$fro.url_nosdeputes,$fro.url_NosDeputes_api)
                break;
            }
            
            
        }
        "all"{
            $mu = "https://www.nosdeputes.fr/organismes/groupe/json"
            write-verbose "[ALL]Telechargement des données depuis internet..."
            $FROrganismes = (invoke-restmethod $RC_Data.Urls.organisme)
           

            foreach ($fro in $FROrganismes.organismes){
                
                [GroupePolitique]::new($fro.organisme.id,$fro.organisme.slug,$fro.organisme.nom,$fro.organisme.acronyme,$fro.organisme.groupe_actuel,$fro.organisme.couleur,$fro.organisme.order,$fro.organisme.type,$fro.organisme.url_nosdeputes,$fro.organisme.url_NosDeputes_api)
            }
            break;
        }
        Default {
            throw "Parameter set undifined!"
        }
    }
        
    
}

Get-RCGroupePolitique -Nom UAI -ListMembres