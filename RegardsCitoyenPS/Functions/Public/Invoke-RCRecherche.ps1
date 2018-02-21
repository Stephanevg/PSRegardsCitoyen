
Function Invoke-RCRecherche {
    <#
        .SYNOPSIS
        Permet d'effectuer une recherche sur NosDeputes.fr
        
        .DESCRIPTION
        Il existe deux manière 'utiliser cette cmdlet:
        1) en utilisant les parametres -Type -Text (Et optionellement -Format et / -limit)
        2) avec le parametre -Query (seul)
        
        .PARAMETER Text
        Specifie le text a rechercher au sein de la base de donnée de NosDeputes.Fr
        
        .PARAMETER Type
        Permet de specifier spécifier sur quel type de document nous souhaitons éffectuer la recherche.

        Accepte les valeurs suivants:
            Parlementaire
            Organisme
            Intervention
            Amendement
            QuestionEcrite
            Section
            Texteloi
            Commentaire

        .PARAMETER Format
            Permet de spécifier le format qui est retourné.
            Par defaut, le retour est en JSON

            Les valeurs acceptées sont:
            JSON
            CSV
            XML

        .PARAMETER Limit
            Permet de limiter le nombre de retour que la recherche nous retourne. 
            Ne peut être superieur à 500.

        .PARAMETER Query
            Permet d'écrire des query en utilisant "le query language" directement.
            Utiliser ce paramètre retourne les données brutes.
            Ceci signifique qu'il faut encore les rechercher au sein de l'objet.

            CF: Exemple Get-help Invoke-RCRecherche -Examples

        .PARAMETER Raw
            Retourne les données au format brut (sans la mis en forme).
            Est préférable pour l'utilisation au sein de scripts.

        .EXAMPLE
        Invoke-RCRecherche -Type Texteloi -Text "cumul" -limit 7 -Format json

        Tout les textes de loi qui contiennent le mot "cumul". Limit le nombre de retours à 7, et retour auf format JSON.

        document_type document_id document_url
        ------------- ----------- ------------
        Texteloi               38 http://www.nosdeputes.fr//api/document/Texteloi/38/json
        Texteloi               52 http://www.nosdeputes.fr//api/document/Texteloi/52/json
        Texteloi              313 http://www.nosdeputes.fr//api/document/Texteloi/313/json
        Texteloi              348 http://www.nosdeputes.fr//api/document/Texteloi/348/json
        Texteloi              619 http://www.nosdeputes.fr//api/document/Texteloi/619/json
        Texteloi              130 http://www.nosdeputes.fr//api/document/Texteloi/130/json
        Texteloi              139 http://www.nosdeputes.fr//api/document/Texteloi/139/json

        .EXAMPLE

        Invoke-RCRecherche -Query "?cumul+mandat&object_name=QuestionEcrite&format=xml"

        Explication de la query:
        ? ->  signifie "debut de la query de recherche".
        cumul+mandat -> recherche sur les motes clés "cumul mandat" (Le + symbolise un espace)
        & -> prochain parametre "Cle-valeur"
        object_name=QuestionEcrite -> Filtre uniquement sur les question ecrites
        & -> prochain paramètre "cle-valeur"
        format=xml -> retourne les données au format XML

        REtourne le resultat suivant:

        search
        ------
        search

        (Voir exemple suivant pour l'expliquation aux données)

        .EXAMPLE
        L'exemple suivant illustre comment les données peuvent être lu/traités lorsque Invoke-RCRecherche est utilisé avec le paramètre 'Query'
        La méthodologie est la même lorsque le parametre -Raw est utilisé.

        $Retour = Invoke-RCRecherche -Query "?cumul+mandat&object_name=QuestionEcrite&format=xml"
        $Retour.search

        Nous avons un premier niveau d'objet avec des données relatif à la recherche (Pas les resultats de la recherche en elle même)

        start end last_result results
        ----- --- ----------- -------
        1     50  5788        results

        Pour Accéder au résultats de la recherche en soit, il faut les récuperer dans l'objet 'results'

        $Retour.Search.results.result

        document_type  document_id document_url
        -------------  ----------- ------------
        QuestionEcrite 17          http://www.nosdeputes.fr//api/document/QuestionEcrite/17/xml
        QuestionEcrite 28          http://www.nosdeputes.fr//api/document/QuestionEcrite/28/xml
        QuestionEcrite 5           http://www.nosdeputes.fr//api/document/QuestionEcrite/5/xml
        QuestionEcrite 45          http://www.nosdeputes.fr//api/document/QuestionEcrite/45/xml
        QuestionEcrite 177         http://www.nosdeputes.fr//api/document/QuestionEcrite/177/xml
        QuestionEcrite 110         http://www.nosdeputes.fr//api/document/QuestionEcrite/110/xml
        QuestionEcrite 219         http://www.nosdeputes.fr//api/document/QuestionEcrite/219/xml
        QuestionEcrite 29          http://www.nosdeputes.fr//api/document/QuestionEcrite/29/xml
        (...)

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
    [cmdletBinding(DefaultParameterSetName="Text")]
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$False,ParameterSetName="Query")]
        [ValidateNotNullOrEmpty()]
        [String]$Query,

        [Parameter(Mandatory=$False,ParameterSetName="Text")]
        [ValidateNotNullOrEmpty()]
        [String]$Text,

        [Parameter(Mandatory=$true,ParameterSetName="Text")]
        [ValidateNotNullOrEmpty()]
        [RechercheType]$Type,

        [Parameter(Mandatory=$False,ParameterSetName="Text")]
        [ValidateNotNullOrEmpty()]
        [Format]$Format = "json",

        [Parameter(Mandatory=$False,ParameterSetName="Text")]
        [ValidateNotNullOrEmpty()]
        [ValidateRange(1,500)]
        [int]$Limit,

        [Switch]
        $Raw

    )

 

 

    switch ($PsCmdlet.ParameterSetName) {
       
        "Query"{
            $url = $RC_Data.urls.recherche + $Query
            Break;
        }
        "Text"{

                $url = $RC_Data.urls.recherche + $text + "?object_name=" + $Type 

                if($Format){
                    $url = $url + "&format=$Format"
                }

                if($PSCmdlet.MyInvocation.BoundParameters.Keys -contains "Limit"){
                    $url = $url + "&count=$limit"
                }
            
            Break;
        }
        Default{
            throw "Parameterset not defined."
        }
    }

        
        try{
            $data = Invoke-RestMethod -Uri $url -ErrorAction Stop
        }Catch [System.Net.WebException]{
            write-warning "Server indisponible: Merci de vérifier vôtre connection internet."
            break
           
        }Catch{
            $_.exception.message
        }
        
        if ($Raw){
            return $data
        }elseif($Query){
            return $data
        }else{
            Switch($Format.ToString().ToUpper()){
                "JSON"{
                    
                    return $Data.results
                    break;
                }
                "CSV"{
                    return $data
                    Break;
                }
                "XML"{
                    Return $data.search.results.result
                    Break;
                }
            }
        }

        

        
}