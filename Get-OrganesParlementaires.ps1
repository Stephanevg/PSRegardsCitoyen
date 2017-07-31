
Function Get-OrganeParlementaire {
    [cmdletbinding()]
    Param(
        [Parameter(Mandatory=$false)]$nom
    )

    $url = "https://www.nosdeputes.fr/organismes/parlementaire/json"

    $retour = Invoke-RestMethod $url

    return $retour.Organismes.organisme
}