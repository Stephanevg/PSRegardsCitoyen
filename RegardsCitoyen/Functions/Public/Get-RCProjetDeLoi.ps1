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

        [Parameter(Mandatory=$true,ParameterSetName="Nom")]
        [String]$Nom,

        [Parameter(Mandatory=$false,ParameterSetName="id")]
        [ValidateNotNullOrEmpty()]
        [String]$id
     
    )


    switch ($PsCmdlet.ParameterSetName) {
        
          
        "All"{
            $Data = Invoke-RestMethod -Uri $RC_data.urls.Dossiers
    
            
            Foreach ($entry in $Data.sections.section){
                
                (invoke-restmethod $Entry.url_nosdeputes_api).Section
            }
            break;
        }
        "id"{
            $urlid = $RC_data.Urls.Dossiers.replace("dossiers/nom/json",("15/dossier/" + $id + "/json"))
            $ret = (Invoke-restmethod $urlid).section
            
            [ProjetDeLoi]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date)
            break;
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }




}

Get-RCProjetDeLoi -id 2066