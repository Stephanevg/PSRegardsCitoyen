Function Get-RCDossier {
    <#
    .SYNOPSIS
    Liste les dossiers sur les quels les députes ont travaillés-
    
    .DESCRIPTION
    Un dossier est un sujet sur le quel le gouvernement ce va débattre. Il en résulte souvent un rapport, et peut déboucher sur une proposition de texte de loi.
    Cette loi n'est pas obligatoirement adopté.
    
    .PARAMETER id
    Le parametre ID permet de filtrer les retours sur un dossier particulier

    
    .PARAMETER Full
    Dans un soucis d'éfficacité, pas toutes les données ne sont récuprer lors des requetes.
    Pour retourner toutes les données, il faut utiliser le paramtre 'Full' qui recuprerer toutes les donnees d'une dossier.
    La requête sera elle plus gourmande, et pourra mettre un peu plus de temps a ce finaliser.
    

    
    .EXAMPLE
    Get-RCProjetDeLoi

    id              : 2072
    Titre           : Accès à l'eau
    MinDate         : 2/1/2018 12:00:00 AM
    MaxDate         : 2/1/2018 12:00:00 AM
    NbInterventions : 92
    Intervenants    :
    Seances         :
    Documents       :
    SousSection     :

    id              : 1557
    Titre           : Accord de partenariat entre l'union européenne et le kazakhstan
    MinDate         : 12/18/2017 12:00:00 AM
    MaxDate         : 12/18/2017 12:00:00 AM
    NbInterventions : 41
    Intervenants    :
    Seances         :
    Documents       :
    SousSection     :


    (Certains champs sont encore vide. Afin de le retourner tous, il faut utiliser la parametre 'Full')

    .EXAMPLE

    Filtrage sur un dossier précis via le paramètre 'ID'

    Get-RCProjetDeLoi -id 1235


    id              : 1235
    Titre           : Bonne application du régime d'asile européen
    MinDate         : 12/7/2017 12:00:00 AM
    MaxDate         : 2/15/2018 12:00:00 AM
    NbInterventions : 352
    Intervenants    :
    Seances         :
    Documents       :
    SousSection     :
    
    (Certains champs sont encore vide. Afin de le retourner tous, il faut utiliser la parametre 'Full')

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


    [cmdletBinding(DefaultParameterSetName="all")]
    Param(

        [Parameter(Mandatory=$false,ParameterSetName="id")]
        [ValidateNotNullOrEmpty()]
        [String]$id,

        [Parameter(Mandatory=$false)]
        [Switch]$Full
     
    )


    switch ($PsCmdlet.ParameterSetName) {
        
          
        "All"{
            $Data = Invoke-RestMethod -Uri $RC_data.urls.Dossiers
    
            Foreach ($entry in $Data.sections.section){
                
                $ret = (invoke-restmethod $Entry.url_nosdeputes_api).Section

                $id_sceances = $ret.seances.seance.id
                $id_intervenants = $ret.intervenants.parlementaire.slug
                $id_soussections = $ret.soussections.soussection.id
                $id_documents = $ret.documents.document.id

                $Dos = [Dossier]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date,$id_intervenants,$id_documents,$id_sceances,$id_soussections)
                
                if ($Full){
                
                    $Dos.Full()

                }else{
                    $Dos
                }
                $Dos = $null
            }
            break;
        }
        "id"{
            $urlid = $RC_data.Urls.Dossiers.replace("dossiers/nom/json",("15/dossier/" + $id + "/json"))
            $ret = (Invoke-restmethod $urlid).section
            
            $id_sceances = $ret.seances.seance.id
                $id_intervenants = $ret.intervenants.parlementaire.slug #| Out-String
                $id_soussections = $ret.soussections.soussection.id
                $id_documents = $ret.documents.document.id


                $Dos = [Dossier]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date,$id_intervenants,$id_documents,$id_sceances,$id_soussections)
                if ($Full){
                
                    $Dos.Full()

                }else{
                    $Dos
                }
                $Dos = $null
            break;
        }
        
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }




}
