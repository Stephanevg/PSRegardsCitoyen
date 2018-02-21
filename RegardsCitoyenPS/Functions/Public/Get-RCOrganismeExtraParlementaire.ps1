

Function Get-RCOrganismeExtraParlementaire {
    <#
    .SYNOPSIS
    Retoure les organisme extra parlementaires
    
    .DESCRIPTION
    Permet de lister tous les organisme extra parlementaires.
    En utilisant le paramètre "-slug" il est possible recuperer un organisme extra parlementaire.

    
    .PARAMETER slug
   Permet de recuper un organisme extra parlementaire précis.
   Recupere 
   
    .PARAMETER Full
   Permet de recuper un organisme précis, Ainsi que tous les députes qui sont membre de l'organisme (Disponible dans la propriété "Membres").
   Attention ! Ce paramètre est gourmande en ressource réseau, et peux être source lenteur.

   Il est préferable de l'utiliser accompagné du paramètre 'slug' afin de limiter l'impacte sur les performances réseau.
    
    .EXAMPLE
    Get-RCOrganismeExtraParlementaire 

    Id Nom                                                                                          Type  Membres
    -- ---                                                                                          ----  -------
    297 Observatoire des espaces naturels, agricoles et forestiers                                   extra
    440 Observatoire national de la sécurité et de l'accessibilité des établissements d'enseignement extra
    446 Observatoire national du service public de l'électricité et du gaz                           extra
    333 Office franco-québécois pour la jeunesse                                                     extra
    36 Section française de l'assemblée parlementaire de la francophonie a.p.f                      extra
    (...)

    List les Organismes Extra palementaire
    
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

        [Parameter(Mandatory=$False,ParameterSetName="slug")]
        [ValidateNotNullOrEmpty()]
        [String[]]$slug,

        [Switch]$Full
     
    )

    $Url = $rc_data.urls.extra
    

    switch ($PsCmdlet.ParameterSetName) {
       
        "slug"{
                
                    #Aujourd'hui (2/18/2018) les donnees dispo via l'api manque les document produits.
                    #https://www.nosdeputes.fr/organisme/bureau-de-l-assemblee-nationale/json Retourne finalement QUE la liste des dep membres.
                    #issue ouvert ici --> https://github.com/regardscitoyens/nosdeputes.fr/issues/98
                
                foreach ($sl in $slug){
                    
                    #$url = ""
                    #$url = $RC_data.Urls.extra.Replace("s/extra/json",("/" + $sl + "/json"))
                    $AllOrganismes = (Invoke-restmethod -uri $url).Organismes.organisme
                    $ret = $AllOrganismes | ? {$_.slug -eq $slug}
                    $obj = [Organisme]::new($ret.id,$ret.nom,$ret.type,$ret.slug,$ret.url_nosdeputes_api)
                    
                    if ($Full){
                        $obj._LoadMembres()
                        
                    }
    
                    $obj
                    $obj = $null
                    
                    
                        
                    
                    
                    Continue;
                }
        }
        "all"{
            $all = invoke-restMethod $Url   
            
            foreach ($ret in $all.organismes.organisme){

                
                
                $obj = [Organisme]::new($ret.id,$ret.nom,$ret.type,$ret.slug,$ret.url_nosdeputes_api)
                if ($Full){
                    $obj._LoadMembres()
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
