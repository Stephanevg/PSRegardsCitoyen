
Function Get-RCGroupePolitique {
    <#
    .SYNOPSIS
    REtourne la liste des groupes politique actuellement existant en France.
    
    .DESCRIPTION
    Liste tous les groupes politique Français aujourd'hui en fonction.
    les données sources sont de www.nosdeputes.fr
    
    .PARAMETER Nom
    Permet de filtrer sur un groupe politique en particuler à partir de son nom.
    
    Note: Le filtrage est fait en mémoire et peut est gourmand en ressource.
    
    .PARAMETER ListMembres
    Permet de liste les membres d'un groupe politique en particulier.

    Note: Le filtrage est fait en mémoire et peut est gourmand en ressource.
    
    .EXAMPLE
    La commande suivante retourne la liste de tous les membre du groupe UAI

   Get-RCGroupePolitique -Nom UAI -ListMembres | format-table

    id Nom                Prenom          Sexe DateNaissance          LieuNaissance                       Groupe NomCirconscription              numcirco PlaceHem
                                                                                                                                                            icylce
    -- ---                ------          ---- -------------          -------------                       ------ ------------------              -------- --------
    81 Riester            Franck             H 1/3/1974 12:00:00 AM   Paris 15ème (Paris)                 UAI    Seine-et-Marne                         5      124
    406 Auconie            Sophie             F 8/19/1963 12:00:00 AM  Dugny (Seine-Saint-Denis)           UAI    Indre-et-Loire                         3      134
    298 Becht              Olivier            H 4/28/1976 12:00:00 AM  Strasbourg (Bas-Rhin)               UAI    Haut-Rhin                              5      154
    173 Benoit             Thierry            H 9/13/1966 12:00:00 AM  Fougères (Ille-et-Vilaine)          UAI    Ille-et-Vilaine                        6      113
    334 Bournazel          Pierre-Yves        H 8/31/1977 12:00:00 AM  Riom-Ès-Montagne (Cantal)           UAI    Paris                                 18      146
    198 Bricout            Guy                H 2/18/1944 12:00:00 AM  Caudry (Nord)                       UAI    Nord                                  18      140
    380 Christophe         Paul               H 2/10/1971 12:00:00 AM  Sables d'Olonne (Vendée)            UAI    Nord                                  14      141
    553 Courson (de)       Charles            H 4/2/1952 12:00:00 AM   Paris (Paris)                       UAI    Marne                                  5      147
    303 Demilly            Stéphane           H 6/26/1963 12:00:00 AM  Albert (Somme)                      UAI    Somme                                  5      125
    561 Descamps           Béatrice           F 4/24/1961 12:00:00 AM  Valenciennes (Nord)                 UAI    Nord                                  21      157
    241 Dunoyer            Philippe           H 1/11/1968 12:00:00 AM  Nouméa (Nouvelle-Calédonie)         UAI    Nouvelle-Calédonie                     1      120
    256 Favennec Becot     Yannick            H 8/12/1958 12:00:00 AM  Chaudron-en-Mauges (Maine-et-Loire) UAI    Mayenne                                3      112
    277 Firmin Le Bodo     Agnès              F 11/20/1968 12:00:00 AM Havre (Seine-Maritime)              UAI    Seine-Maritime                         7      158
    401 Gomès              Philippe           H 10/27/1958 12:00:00 AM Alger (Algérie)                     UAI    Nouvelle-Calédonie                     2      104
    46 Habib              Meyer              H 4/28/1961 12:00:00 AM  Paris 12 (Paris)                    UAI    Français établis hors de France        8      144
    456 Herth              Antoine            H 2/14/1963 12:00:00 AM  Sélestat (Bas-Rhin)                 UAI    Bas-Rhin                               5      143
    77 Jégo               Yves               H 4/17/1961 12:00:00 AM  Besançon (Doubs)                    UAI    Seine-et-Marne                         3      132
    547 La Raudière (de)   Laure              F 2/12/1965 12:00:00 AM  Neuilly-sur-Seine (Hauts-de-Seine)  UAI    Eure-et-Loir                           3      133
    235 Lagarde            Jean-Christophe    H 10/24/1967 12:00:00 AM Châtellerault (Vienne)              UAI    Seine-Saint-Denis                      5      135
    398 Ledoux             Vincent            H 6/21/1966 12:00:00 AM  Watermael-Boitsfort (Belgique)      UAI    Nord                                  10      129
    290 Leroy              Maurice            H 2/2/1959 12:00:00 AM   Paris (Paris)                       UAI    Loir-et-Cher                           3      111
    259 Magnier            Lise               F 12/31/1984 12:00:00 AM Châlons-sur-Marne (Marne)           UAI    Marne                                  4      156
    423 Morel-À-L'Huissier Pierre             H 12/21/1958 12:00:00 AM Strasbourg (Bas-Rhin)               UAI    Lozère                                 1      105
    114 Naegelen           Christophe         H 12/30/1983 12:00:00 AM Remiremont (Vosges)                 UAI    Vosges                                 3      155
    34 Pancher            Bertrand           H 6/5/1958 12:00:00 AM   Saint-Mihiel (Meuse)                UAI    Meuse                                  1      103
    299 Sage               Maina              F 5/10/1975 12:00:00 AM  Papeete (Polynésie Française)       UAI    Polynésie Française                    1      130
    464 Sanquer            Nicole             F 6/16/1972 12:00:00 AM  Papeete (Polynésie française)       UAI    Polynésie Française                    2      145
    416 Vercamer           Francis            H 5/10/1958 12:00:00 AM  Lille (Nord)                        UAI    Nord                                   7      123
    116 Vigier             Philippe           H 2/3/1958 12:00:00 AM   Valence (Drôme)                     UAI    Eure-et-Loir                           4      114
    434 Villiers           André              H 12/13/1954 12:00:00 AM Avallon (Yonne)                     UAI    Yonne                                  2      153
    497 Warsmann           Jean-Luc           H 10/22/1965 12:00:00 AM Villers-Semeuse (Ardennes)          UAI    Ardennes                               3      106
    329 Zumkeller          Michel             H 1/21/1966 12:00:00 AM  Belfort (Territoire de Belfort)     UAI    Territoire de Belfort                  2      122
    
    .NOTES
        -Version: 1.0
        -Author: Stéphane van Gulick 
        -CreationDate: 01/02/2018
        -LastModifiedDate: 01/02/2018
        -History:
            01/02/2018: Creation : Stéphane van Gulick
       
            Blog: www.powershelldistrict.com
            Site Source: www.nosdeputes.fr
    #>
    [CmdletBinding(DefaultParameterSetName="all")]
    Param(

        [Parameter(Mandatory=$true,ParameterSetName="get")]
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

                try{
                    $data = (Invoke-RestMethod -Uri $url -ErrorAction Stop).deputes
                }Catch [System.Net.WebException]{
                    write-warning "Server indisponible: Merci de vérifier vôtre connection internet."
                    break
                   
                }Catch{
                    $_.exception.message
                    continue
                }

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

                try{
                    $all = (invoke-restmethod -Uri $url).organismes.organisme
                }Catch [System.Net.WebException]{
                    write-warning "Server indisponible: Merci de vérifier vôtre connection internet."
                    break
                   
                }Catch{
                    $_.exception.message
                }

                
                $fro = $all | ? {$_.acronyme -eq $Nom}
                [GroupePolitique]::new($fro.id,$fro.slug,$fro.nom,$fro.acronyme,$fro.groupe_actuel,$fro.couleur,$fro.order,$fro.type,$fro.url_nosdeputes,$fro.url_NosDeputes_api)
                break;
            }
            
            
        }
        "all"{
            
            write-verbose "[ALL]Telechargement des données depuis internet..."

            try{
                $data = Invoke-RestMethod -Uri $RC_data.urls.organisme -ErrorAction Stop
            }Catch [System.Net.WebException]{
                write-warning "Server indisponible: Merci de vérifier vôtre connection internet."
                break
               
            }Catch{
                $_.exception.message
            }

            
           

            foreach ($fro in $data.organismes){
                
                [GroupePolitique]::new($fro.organisme.id,$fro.organisme.slug,$fro.organisme.nom,$fro.organisme.acronyme,$fro.organisme.groupe_actuel,$fro.organisme.couleur,$fro.organisme.order,$fro.organisme.type,$fro.organisme.url_nosdeputes,$fro.organisme.url_NosDeputes_api)
            }
            break;
        }
        Default {
            throw "Parameter set undifined!"
        }
    }
        
    
}