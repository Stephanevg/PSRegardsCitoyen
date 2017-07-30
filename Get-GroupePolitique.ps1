
Class GroupePolitique {
    [int]$id
    [string]$Slug
    [string]$Nom
    [string]$Acronyme
    [string]$GroupeActuel
    [string]$Couleur
    [string]$Type
    [string]$Order
    [string]$urlNosDeputes
    hidden [string]$urlNosDeputesAPI
    
    GroupePolitique([int]$id,[string]$slug,[string]$nom,[string]$Acronyme,[string]$GroupeActuel,[string]$Couleur,[String]$Order,[string]$Type,[string]$urlNosDeputes,[string]$urlNosDeputesAPI){
        $this.id = $id
        $this.Slug = $slug
        $this.nom = $nom
        $this.Acronyme = $Acronyme
        $this.GroupeActuel = $GroupeActuel
        $this.Couleur = $Couleur
        $this.order = $Order
        $this.type = $type
        $this.urlNosDeputes = $urlNosDeputes   
        $this.urlNosDeputesAPI = $urlNosDeputesAPI
    }

    
}
Function Get-FRGroupePolitique {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$false)]$Nom,
        [switch]$Force

    )

    if (!($script:FROrganismes) -or $Force){
        $mu = "https://www.nosdeputes.fr/organismes/groupe/json"
        write-verbose "Telechargement des données depuis internet et mise en mémoire..."
        $script:FROrganismes = invoke-restmethod $mu
    }

    $return = @()

    foreach ($fro in $FROrganismes.organismes){
        $return += [GroupePolitique]::new($fro.organisme.id,$fro.organisme.slug,$fro.organisme.nom,$fro.organisme.acronyme,$fro.organisme.groupe_actuel,$fro.organisme.couleur,$fro.organisme.order,$fro.organisme.type,$fro.organisme.url_nosdeputes,$fro.organisme.url_NosDeputes_api)
    }
    return $return
}