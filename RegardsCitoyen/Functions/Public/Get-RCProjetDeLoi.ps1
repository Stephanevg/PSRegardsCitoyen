Function Get-RCProjetDeLoi {
    <#
    .SYNOPSIS
    #Recupere des donnÃ©es statitques d'un ou plusieurs dÃ©putÃ©(s)
    
    .DESCRIPTION
    Permet de rÃ©cuperer des donnÃ©es statitiques des reprÃ©sentants politique FranÃ§ais.
    
    .PARAMETER Type
    Parameter description
    
    .PARAMETER Valeur
    Parameter description
    
    .PARAMETER DetailsDe
    Parameter description
    
    .EXAMPLE
    Get-RCDepute -Type Fillon -Valeur menuel -DetailsDe

    .EXAMPLE
    Get-RCDepute -Type Circonscription -Valeur Haut-Rhin | select nom,Sexe,Groupe_sigle
    
    .NOTES
    General notes
    #>


    [cmdletBinding(DefaultParameterSetName="all")]
    Param(

        [Parameter(Mandatory=$false,ParameterSetName="id")]
        [ValidateNotNullOrEmpty()]
        [String]$id
     
    )


    switch ($PsCmdlet.ParameterSetName) {
        
          
        "All"{
            $Data = Invoke-RestMethod -Uri $RC_data.urls.Dossiers
    
            Foreach ($entry in $Data.sections.section){
                
                $ret = (invoke-restmethod $Entry.url_nosdeputes_api).Section

                $id_sceances = $ret.seances.seance.id
                $id_intervenants = $ret.intervenants.parlementaire.slug | Out-String
                $id_soussections = $ret.soussections.soussection.id
                $id_documents = $ret.documents.document.id

                
                [ProjetDeLoi]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date,$id_intervenants,$id_documents,$id_sceances,$id_soussections)
            }
            break;
        }
        "id"{
            $urlid = $RC_data.Urls.Dossiers.replace("dossiers/nom/json",("15/dossier/" + $id + "/json"))
            $ret = (Invoke-restmethod $urlid).section
            
            $id_sceances = $ret.seances.seance.id
                $id_intervenants = $ret.intervenants.parlementaire.slug | Out-String
                $id_soussections = $ret.soussections.soussection.id
                $id_documents = $ret.documents.document.id

            [ProjetDeLoi]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date,$id_intervenants,$id_documents,$id_sceances,$id_soussections)
            break;
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }




}

Get-RCProjetDeLoi -id 488