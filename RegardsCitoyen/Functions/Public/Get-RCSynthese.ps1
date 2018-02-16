
Function Get-RCSynthese {
    <#
    .SYNOPSIS
    Get-RCSynthese 
    Attention, le results retournées concernent uniquement les parlementaires qui ont effectué une activité.

    .DESCRIPTION
    Long description
    
    .PARAMETER Date
    Le format a resecter est le suivant:
        AAAAMM

        AAAA Corrspond a l'année sur quatre chiffres Example -> 2017
        MM correspond au mois voulu Exemple -> 04 (avril)
    
        Voir exemples plus bas.

    .EXAMPLE
    Get-RcSynthese

    REtourne les données de synthese de tous les mois de cette législature.

    .EXAMPLE
    Get-RcSynthese -Date 201704

    REtourne les données de synthese du mois d'avril de 2017
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$false)]
        [ValidatePattern('^\d{6}')]
        $Date=(get-date -UFormat %Y%m)
        
        
    )

    
    #[Synthese] L'API retourne des fois un groupe vide. (Erreur?) Ca fait planter le constructeur Synthese
    $url = ($RC_data.Urls.Synthese).Replace("data/json",$Date) + "/json"

    

    $Parameters = @{
        "Uri" = $url
    }


    $Data = Invoke-RestMethod @Parameters

    Foreach ($syn in $Data.Deputes.Depute){
        try{

            [Synthese]::New($syn.id,$syn.nom,$syn.Groupe,$syn.Amendements_Adoptes,$syn.Amendements_Proposes,$syn.Amendements_Signes,$syn.Commision_Interventions,$syn.Commision_Presences,$syn.hemicycle_Interventions,$syn.hemicycle_Interventions_Courtes,$syn.Proposition_Ecrites,$syn.Propositions_Signees,$syn.Questions_Ecrites,$syn.Questions_Orales,$syn.Rapports,$syn.Semaines_Presence)
        }Catch{
            $_
        }
    }

}
