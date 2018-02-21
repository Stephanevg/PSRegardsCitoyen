Function Get-RCMembreGroupePolitique {
    [CmdletBinding()]
    Param(
        $NomGroupe
    )

    $Url = "https://www.nosdeputes.fr/groupe/$($NomGroupe)/json"

    try{
        $retour = invoke-RestMethod $url -ErrorAction Stop
        return $retour.deputes
    }Catch{
        write-warning $_

    }
    

    
}
