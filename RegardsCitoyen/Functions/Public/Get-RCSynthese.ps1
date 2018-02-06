
Function Get-RCSynthese {
    <#
    .SYNOPSIS
    Get-RCSynthese 
    Attention, le results retournées concernent uniquement les parlementaires qui ont repondu.
    .DESCRIPTION
    Long description
    
    .PARAMETER Date
    Parameter description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$false)]
        [ValidatePattern('^\d{6}')]
        $Date=(get-date -UFormat %Y%m)
        
        
    )

    
    #https://www.nosdeputes.fr/synthese/$mois/Json
    #synthese = "https://www.nosdeputes.fr/synthese/"
    $url = ($RC_data.Urls.Synthese).Replace("data/json",$Date) + "/json"

    

    $Parameters = @{
        "Uri" = $url
    }


    $Data = Invoke-RestMethod @Parameters

    Foreach ($syn in $Data.Deputes.Depute){
        [Synthese]::New($syn.id,$syn.nom,$syn.Groupe,$syn.Amendements_Adoptes,$syn.Amendements_Proposes,$syn.Amendements_Signes,$syn.Commision_Interventions,$syn.Commision_Presences,$syn.hemicycle_Interventions,$syn.hemicycle_Interventions_Courtes,$syn.Proposition_Ecrites,$syn.Propositions_Signees,$syn.Questions_Ecrites,$syn.Questions_Orales,$syn.Rapports,$syn.Semaines_Presence)
    }

}