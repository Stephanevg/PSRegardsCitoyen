Function Get-RCSeance {
    <#
    .SYNOPSIS
    Recupere la liste des interventions faites pour une seance bien particuliere.
    
    .DESCRIPTION
    Fournit la liste complete des interventions, le nom de l'intervenant etc...
    
    .PARAMETER Id
   Permet de lister toutes les interventions relatives a une scéeances bien particulière via le parametre ID.
    

    
    .EXAMPLE
    Get-RCSeance -id 234

    id             : 234
    Titre          : réunion du 12 octobre 2017 à 9h30
    Lieu           : Commission de la défense nationale et des forces armées
    Date           : 10/12/2017 9:30:00 AM
    Type           : commission
    Section        :
    SousSection    :
    NomIntervenant :
    Contenu        : <p>Auditions de représentants d'associations d'anciens combattants</p>
    tags           :
    Amendements    :
    Loi            : {}

    id             : 234
    Titre          : réunion du 12 octobre 2017 à 9h30
    Lieu           : Commission de la défense nationale et des forces armées
    Date           : 10/12/2017 9:30:00 AM
    Type           : commission
    Section        :
    SousSection    :
    NomIntervenant : Jean-Michel Jacques
    Contenu        : <p><i>(disponible uniquement en vidéo)</i></p>
    tags           :
    Amendements    :
    Loi            : {}

    .EXAMPLE
    
    .NOTES
    Stéphane van Gulick
    #>


    [cmdletBinding(DefaultParameterSetName="id")]
    Param(

        [Parameter(Mandatory=$true,ParameterSetName="id")]
        [ValidateNotNullOrEmpty()]
        [String]$id
     
    )


    switch ($PsCmdlet.ParameterSetName) {

        "id"{
            $urlid = $RC_data.Urls.Seance + $id + "/json"
            $Interventions = Invoke-restmethod -uri $urlid -Verbose

            Foreach ($ret in $Interventions.seance.intervention){
                $DAte = ""
                $Date = $ret.date +" "+ $ret.heure
                $lois = @()
                foreach ($i in $ret.lois){
                    $lois += [int]$i.id
                }
                [Intervention]::New($ret.seance_id,$ret.seance_titre,$ret.seance_Lieu,$Date,$ret.type,$ret.section,$ret.soussection,$ret.intervenant_nom,$ret.intervenant_slug,$ret.Contenu,$ret.Tags,$ret.amendements,$Lois)
                
            }
            #[ProjetDeLoi]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date,$ret.intervenants,$ret.documents,$ret.seances,$ret.soussections)
            break;
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }




}
