Function Get-RCDocument {
    <#
    .SYNOPSIS
    Recupere la liste des Documents.
    
    .DESCRIPTION
    Un document peut être de plusieurs types:
    -> Projet de loi
    -> Amendement
    -> Rapport
    
    .PARAMETER Id
   Permet de lister toutes les interventions relatives a une scéeances bien particulière via le parametre ID.
    

    
    .EXAMPLE
    Get-RCDocument -id 414

    

    .EXAMPLE
    
    .NOTES
    Stéphane van Gulick
    #>


    [cmdletBinding(DefaultParameterSetName="id")]
    Param(

        [Parameter(Mandatory=$true,ParameterSetName="id")]
        [ValidateNotNullOrEmpty()]
        [String[]]$id
     
    )


    switch ($PsCmdlet.ParameterSetName) {

        "id"{
            foreach ($i in $id){
                $urlid = ""
                $urlid = $RC_data.Urls.Document + $i + "/json"
                $data = Invoke-restmethod -uri $urlid
                
                Foreach ($ret in $data.texteloi){
                    $DAte = ""
                    $Date = $ret.date +" "+ $ret.heure
                    
                    [Document]::New($ret.id,$ret.titre,$ret.nb_commentaires,$ret.legislature,$ret.annexe,$ret.type,$ret.type_details,$ret.categorie,$ret.id_dossier_an,$ret.date,$ret.source,$ret.organisme_id,$ret.Signataires,$ret.contenu,$ret.url_nosdeputes)
                    
                }
                #[ProjetDeLoi]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date,$ret.intervenants,$ret.documents,$ret.seances,$ret.soussections)
                Continue;
            }
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }




}