

Function Get-RCOrganismeParlementaire {
    <#
    .SYNOPSIS
    Retoure les organisme parlementaires
    
    .DESCRIPTION
    Permet de liste les organisme parlementaires.
    
    .PARAMETER slug
   Permet de recuper un organisme précis.
   
    .PARAMETER Full
   Permet de recuper un organisme précis, avec les memebres y compris (Disponible dans la propriété "Membres".
   
    
    .EXAMPLE
    Get-RCOrganismeParlementaire 

     Id Nom
    -- ---
    2 Bureau de l'assemblée nationale
    22 Comité d'évaluation et de contrôle des politiques publiques
    24 Commission chargée de l'application de l'article 26 de la constitution
    374 Commission d'enquête chargée d'examiner les décisions de l'État en matière de politique industrielle, au regard ...
    574 Commission d'enquête sur la sûreté et la sécurité des installations nucléaires
    560 Commission d'enquête sur les maladies et pathologies professionnelles dans l'industrie risques chimiques...
    16 Commission de la défense nationale et des forces armées
    11 Commission des affaires culturelles et de l'éducation
    13 Commission des affaires économiques
    18 Commission des affaires étrangères
    (...)

    .EXAMPLE
    
    .NOTES
    RegardsCitoyen (cr)
    Stéphane van Gulick
    #>


    [cmdletBinding(DefaultParameterSetName="all")]
    Param(

        #[Parameter(Mandatory=$False,ParameterSetName="slug")]
        #[ValidateNotNullOrEmpty()]
        #[String[]]$slug,

        [Switch]$Full
     
    )


    switch ($PsCmdlet.ParameterSetName) {
      <#  
        "slug"{
                
                    #Aujourd'hui (2/18/2018) les donnees dispo via l'api manque les document produits.
                    #https://www.nosdeputes.fr/organisme/bureau-de-l-assemblee-nationale/json Retourne finalement QUE la liste des dep membres.
                    #issue ouvert ici --> https://github.com/regardscitoyens/nosdeputes.fr/issues/98
                
                foreach ($sl in $slug){
                    $url = ""
                    $url = $RC_data.Urls.OrganismeParlementaire.Replace("s/parlementaire/json",("/" + $sl + "/json"))
                    $Organisme = Invoke-restmethod -uri $url
                    
                    Foreach ($ret in $Organisme.Organisme){
                        
                        #[Organisme]::new($ret.id,$ret.nom,$ret.type,$ret.slug,$ret.url_nosdeputes_api)
                        
                        
                    }
                    #[ProjetDeLoi]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date,$ret.intervenants,$ret.documents,$ret.seances,$ret.soussections)
                    Continue;
                }
        }
        #>
        "all"{
            $all = invoke-restMethod $RC_data.Urls.OrganismeParlementaire
            
            foreach ($ret in $all.organismes.organisme){

                
                
                $obj = [Organisme]::new($ret.id,$ret.nom,$ret.type,$ret.slug,$ret.url_nosdeputes_api)
                if ($Full){
                    $obj.GetMembres()
                }

                $obj
                $obj = $null
            }
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }

}
