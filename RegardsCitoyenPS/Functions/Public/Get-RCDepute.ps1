Function Get-RCDepute {
    <#
    .SYNOPSIS
    #Recupere des donnÃ©es statitques d'un ou plusieurs dÃ©putÃ©(s)
    
    .DESCRIPTION
    Permet de rÃ©cuperer des donnÃ©es statitiques des reprÃ©sentants politique FranÃ§ais.
    
    .PARAMETER Nom
    Parameter description
    
    .PARAMETER Prenom
    Parameter description
    
    .PARAMETER Id
    Parameter description

    .PARAMETER NumCirconscription


    Note: Le filtrage est effectué coté client, ce qui peut entrainer des effets sur la performance

    .PARAMETER NomCirconscription

    Note: Le filtrage est effectué coté client, ce qui peut entrainer des effets sur la performance

    .PARAMETER NumDepartement

    Permet de filtrer les resultats sur le numéro de département.

    .EXAMPLE

   Filtre les resultats sur le numéro de département '67' (Bas-Rhin).

    Get-RCDepute -NumDepartement 67 | format-table

    id Nom      Prenom   Sexe DateNaissance          LieuNaissance            Groupe NomCirconscription numcirco PlaceHemicylce
    -- ---      ------   ---- -------------          -------------            ------ ------------------ -------- --------------
    26 Wonner   Martine     F 3/27/1964 12:00:00 AM  Hayange (Moselle)        LREM   Bas-Rhin                  4            488
    48 Waserman Sylvain     H 12/8/1967 12:00:00 AM  Paris 07 (Paris)         MODEM  Bas-Rhin                  2            267
    89 Furst    Laurent     H 5/19/1965 12:00:00 AM  Colmar (Haut-Rhin)       LR     Bas-Rhin                  6             80
    306 Thiébaut Vincent     H 5/23/1972 12:00:00 AM  Toulouse (Haute-Garonne) LREM   Bas-Rhin                  9            432
    312 Reiss    Frédéric    H 11/12/1949 12:00:00 AM Haguenau (Bas-Rhin)      LR     Bas-Rhin                  8             77
    373 Michels  Thierry     H 8/27/1960 12:00:00 AM  Strasbourg (Bas-Rhin)    LREM   Bas-Rhin                  1            445
    456 Herth    Antoine     H 2/14/1963 12:00:00 AM  Sélestat (Bas-Rhin)      UAI    Bas-Rhin                  5            143
    487 Studer   Bruno       H 6/18/1978 12:00:00 AM  Colmar (Haut-Rhin)       LREM   Bas-Rhin                  3            478
    570 Hetzel   Patrick     H 7/2/1964 12:00:00 AM   Phalsbourg (Moselle)     LR     Bas-Rhin                  7             79

    Permet de filtrer la recherche sur le numéro de département

    Note: Le filtrage est effectué coté client, ce qui peut entrainer des effets sur la performance
    
    .EXAMPLE
    
    Get-RCDepute -NomCirconscription Haut-Rhin | format-table

    id Nom            Prenom   Sexe DateNaissance          LieuNaissance         Groupe NomCirconscription numcirco PlaceHemicylce
    -- ---            ------   ---- -------------          -------------         ------ ------------------ -------- --------------
    72 Schellenberger Raphaël     H 2/14/1990 12:00:00 AM  Mulhouse (Haut-Rhin)  LR     Haut-Rhin                 4             72
    110 Straumann      Éric        H 8/17/1964 12:00:00 AM  Colmar (Haut-Rhin)    LR     Haut-Rhin                 1             76
    207 Cattin         Jacques     H 6/4/1958 12:00:00 AM   Colmar (Haut-Rhin)    LR     Haut-Rhin                 2             73
    298 Becht          Olivier     H 4/28/1976 12:00:00 AM  Strasbourg (Bas-Rhin) UAI    Haut-Rhin                 5            154
    469 Reitzer        Jean-Luc    H 12/29/1951 12:00:00 AM Altkirch (Haut-Rhin)  LR     Haut-Rhin                 3             75
    528 Fuchs          Bruno       H 4/7/1959 12:00:00 AM   Colmar (Haut-Rhin)    MODEM  Haut-Rhin                 6            181
    
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

        [Parameter(Mandatory=$true,ParameterSetName="Nom")]
        [String]$Nom,

        [Parameter(Mandatory=$true,ParameterSetName="Nom")]
        [String]$Prenom,

        [Parameter(Mandatory=$false,ParameterSetName="id")]
        [ValidateNotNullOrEmpty()]
        [String]$id,

        [Parameter(Mandatory=$false,ParameterSetName="slug")]
        [ValidateNotNullOrEmpty()]
        [String]$Slug,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$NumCirconscription,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$NumDepartement,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$NomCirconscription
     
    )


    switch ($PsCmdlet.ParameterSetName) {

        "slug"{
            $url = $Rc_data.urls.Deputes.Replace("deputes/enmandat/json",$Slug) + "/json"
            $entry = (Invoke-RestMethod -Uri $url).Depute
            
            $Collaborateurs = @()
            foreach ($col in $entry.Collaborateurs.Collaborateur){
                    $Collaborateurs += $col
            }

            $autresmandats = @()
            foreach ($autreMandat in $entry.autres_mandats.mandat){
                    $mandat = ""
                    $mandat = $autreMandat.replace(" ","").split("/")
                    if ($mandat){
                        $autresmandats += [Mandat]::New($mandat[0],$mandat[1],$mandat[2])

                    }
            }

            $Emails = @()
            foreach ($mail in $entry.emails.email){
                    $Emails += $mail
            }
            return [Depute]::New($entry.id,$entry.nom_de_famille,$entry.prenom,$entry.groupe_sigle,$entry.date_naissance,$entry.lieu_naissance,$entry.sexe,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$entry.profession,$entry.twitter,$entry.nb_mandats,$entry.parti_ratt_financier,$autresmandats,$Collaborateurs,$Emails)
            Break;
        }
        "id"{

            

            $Entry = (Invoke-RestMethod -Uri $RC_data.urls.deputes).deputes.depute | ? {$_.id -eq $id}

            $Collaborateurs = @()
            foreach ($col in $entry.Collaborateurs.Collaborateur){
                    $Collaborateurs += $col
            }

            $autresmandats = @()
            foreach ($autreMandat in $entry.autres_mandats.mandat){
                    $mandat = ""
                    $mandat = $autreMandat.replace(" ","").split("/")
                    if ($mandat){
                        $autresmandats += [Mandat]::New($mandat[0],$mandat[1],$mandat[2])

                    }
            }

            $Emails = @()
            foreach ($mail in $entry.emails.email){
                    $Emails += $mail
            }

            return [Depute]::New($entry.id,$entry.nom_de_famille,$entry.prenom,$entry.groupe_sigle,$entry.date_naissance,$entry.lieu_naissance,$entry.sexe,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$entry.profession,$entry.twitter,$entry.nb_mandats,$entry.parti_ratt_financier,$autresmandats,$Collaborateurs,$Emails)
            break;
        }
        "Nom" {
                $slug = ($prenom +"-"+ $Nom)
                $url = ($RC_data.Urls.Deputes).Replace("deputes/enmandat/json",$slug) + "/json"
                
                $Data = (Invoke-RestMethod -Uri $url).depute
                #Depute([String]$Nom,[String]$Prenom,[String]$Groupe,[DateTime]$DateNaissance,[String]$LieuNaissance,[Sexe]$Sexe,[string]$nomcirco,[int]$numcirco,[int]$PlaceHemicylce,[DateTime]$DebutDeMandat,[String]$Profession,[string]$Twitter,[int]$NbMandats){
                return [Depute]::New($data.id,$data.nom_de_famille,$data.prenom,$data.groupe_sigle,$data.date_naissance,$Data.lieu_naissance,$data.sexe,$data.nom_circo,$data.num_circo,$data.place_en_hemicycle,$data.mandat_debut,$data.profession,$data.twitter,$data.nb_mandats,$data.parti_ratt_financier,$autresmandats,$Collaborateurs,$Emails)
                break;
          }
        "All"{
            $Data = (Invoke-RestMethod -Uri $RC_data.urls.deputes).deputes.depute
            
            if ($NumCirconscription){

                $Data = $Data | ? {$_.num_circo -eq $NumCirconscription}

            }elseif($NomCirconscription){
                $Data = $Data | ? {$_.nom_circo -eq $NomCirconscription}
            }elseif($numDepartement){

                $Data = $Data | ? {$_.num_deptmt -eq $numDepartement}

            }

            Foreach ($entry in $Data){

                $Collaborateurs = @()
                foreach ($col in $entry.Collaborateurs.Collaborateur){
                        $Collaborateurs += $col
                }

                $autresmandats = @()
                foreach ($autreMandat in $entry.autres_mandats.mandat){
                        $mandat = ""
                        $mandat = $autreMandat.replace(" ","").split("/")
                        if ($mandat){
                            $autresmandats += [Mandat]::New($mandat[0],$mandat[1],$mandat[2])

                        }
                }

                $Emails = @()
                foreach ($mail in $entry.emails.email){
                        $Emails += $mail
                }

                [Depute]::New($entry.id,$entry.nom_de_famille,$entry.prenom,$entry.groupe_sigle,$entry.date_naissance,$entry.lieu_naissance,$entry.sexe,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$entry.profession,$entry.twitter,$entry.nb_mandats,$entry.parti_ratt_financier,$autresmandats,$Collaborateurs,$Emails)
            }
            break;
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }




}