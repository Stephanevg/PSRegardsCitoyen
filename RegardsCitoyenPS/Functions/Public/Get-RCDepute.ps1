Function Get-RCDepute {
    <#
        .SYNOPSIS
        Recupere des données statitques d'un ou plusieurs député(s)
        
        .DESCRIPTION
        Permet de récuperer des donnÃ©es statitiques des représentants politique Français.
        
        .PARAMETER Nom
        Permet filtrer la recherche sur le nom de famille d'une député. 
        (Ce paramètre doit être utilisé obligatoirement avec le paramètre Prénom )

        Note: Le filtrage est effectué coté client, ce qui peut entrainer des effets sur la performance
        
        .PARAMETER Prenom
        Permet filtrer la recherche sur le Prénom d'une député. 
        (Ce paramètre doit être utilisé obligatoirement avec le paramètre Nom )

        Note: Le filtrage est effectué coté client, ce qui peut entrainer des effets sur la performance
        
        .PARAMETER Id
        Permet de filtrer la recherche sur l'ID d'un député

        .PARAMETER NumCirconscription
        Permet de filtrer la recherche sur le numéro de ciconscription d'ou le député à été élue.

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
        
        .EXAMPLE

        Select d'un député par son nom et prénom (La selection que peut ce faire en combinant Nom et prénom)

        Get-RCDepute -Nom Fuchs -Prenom Bruno


        id                 : 528
        Nom                : Fuchs
        Prenom             : Bruno
        Sexe               : H
        DateNaissance      : 4/7/1959 12:00:00 AM
        LieuNaissance      : Colmar (Haut-Rhin)
        Groupe             : MODEM
        NomCirconscription : Haut-Rhin
        numcirco           : 6
        PlaceHemicylce     : 181
        DebutDeMandat      : 6/21/2017 12:00:00 AM
        Profession         : Industriel-Chef d'entreprise
        Twitter            : bruno_fuchs
        NombreDeMandats    : 1
        partirattfinancier : Mouvement Démocrate
        autresmandats      :
        Collaborateurs     :
        Emails             :

        .EXAMPLE
        Filtrage sur le numéro de cironscription
        Get-RCDepute -NumCirconscription 5 | Fomat-Table

        id Nom               Prenom          Sexe DateNaissance          LieuNaissance                        Groupe NomCirconscription   numcirco PlaceHemicylce
        -- ---               ------          ---- -------------          -------------                        ------ ------------------   -------- --------------
        32 Abad              Damien             H 4/5/1980 12:00:00 AM   Nîmes (Gard)                         LR     Ain                         5             78
        44 Vatin             Pierre             H 8/21/1967 12:00:00 AM  Saint-Quentin (Aisne)                LR     Oise                        5             31
        60 Dubois            Marianne           F 12/17/1957 12:00:00 AM Corbeil-Essonnes (Essonne)           LR     Loiret                      5             20
        68 Masséglia         Denis              H 4/11/1981 12:00:00 AM  Nice (Alpes-Maritimes)               LREM   Maine-et-Loire              5            377
        79 Paris             Didier             H 2/14/1954 12:00:00 AM  Paris (Paris)                        LREM   Côte-d'Or                   5            403
        81 Riester           Franck             H 1/3/1974 12:00:00 AM   Paris 15ème (Paris)                  UAI    Seine-et-Marne              5            124
        90 Lenne             Marion             F 11/20/1974 12:00:00 AM Gardanne (Bouches-du-Rhône)          LREM   Haute-Savoie                5            314
        92 Sarles            Nathalie           F 4/17/1962 12:00:00 AM  Valence (Drôme)                      LREM   Loire                       5            290
        94 Chassaigne        André              H 7/2/1950 12:00:00 AM   Clermont-Ferrand (Puy-de-Dôme)       GDR    Puy-de-Dôme                 5            587
        122 Bouillon          Christophe         H 3/4/1969 12:00:00 AM   Rouen (Seine-Maritime)               NG     Seine-Maritime              5            520
        124 Michel-Kleisbauer Philippe           H 3/6/1969 12:00:00 AM   Draguignan (Var)                     MODEM  Var                         5            259
        131 Melchior          Graziella          F 4/6/1960 12:00:00 AM   Brest (Finistère)                    LREM   Finistère                   5            231
        137 El Haïry          Sarah              F 3/16/1989 12:00:00 AM  (Loir-et-Cher)                       MODEM  Loire-Atlantique            5            172
        138 Potier            Dominique          H 3/17/1964 12:00:00 AM  Toul (Meurthe-et-Moselle)            NG     Meurthe-et-Moselle          5            514
        146 Grelier           Jean-Carles        H 3/15/1966 12:00:00 AM  Mans (Sarthe)                        LR     Sarthe                      5             71
        160 Portarrieu        Jean-François      H 10/14/1965 12:00:00 AM Toulouse (Haute-Garonne)             LREM   Haute-Garonne               5            645
        176 Lazaar            Fiona              F 9/19/1985 12:00:00 AM  (Val-d'Oise)                         LREM   Val-d'Oise                  5            418
        181 Bouyx             Bertrand           H 5/26/1970 12:00:00 AM  Juvisy-sur-Orge (Essonne)            LREM   Calvados                    5            210
        185 Gauvain           Raphaël            H 4/10/1973 12:00:00 AM  Paris 14ème (Paris)                  LREM   Saône-et-Loire              5            241
        196 Brocard           Blandine           F 11/3/1981 12:00:00 AM  Strasbourg (Bas-Rhin)                LREM   Rhône                       5            323
        225 Huppé             Philippe           H 2/12/1968 12:00:00 AM  Mazamet (Tarn)                       LREM   Hérault                     5            395
        228 Gaillard          Olivier            H 2/28/1967 12:00:00 AM  Nîmes (Gard)                         LREM   Gard                        5            243
        235 Lagarde           Jean-Christophe    H 10/24/1967 12:00:00 AM Châtellerault (Vienne)               UAI    Seine-Saint-Denis           5            135
        245 Kamowski          Catherine          F 4/8/1958 12:00:00 AM   Valenciennes (Nord)                  LREM   Isère                       5            335
        274 Bothorel          Éric               H 10/20/1966 12:00:00 AM Paimpol (Côtes-d'Armor)              LREM   Côtes-d'Armor               5            554
        294 Krabal            Jacques            H 4/10/1948 12:00:00 AM  Epieds (Aisne)                       LREM   Aisne                       5            542
        296 Braun-Pivet       Yaël               F 12/7/1970 12:00:00 AM  Nancy (Meurthe-et-Moselle)           LREM   Yvelines                    5            481
        298 Becht             Olivier            H 4/28/1976 12:00:00 AM  Strasbourg (Bas-Rhin)                UAI    Haut-Rhin                   5            154
        300 O'Petit           Claire             F 10/15/1949 12:00:00 AM Epinay-sur-Seine (Seine-Saint-Denis) LREM   Eure                        5            304

        .EXAMPLE

        Filtrage sur tous les députés qui ont été élus dans la circonscription numéro 5, et qui sont membre du groupe politique 'LR' (Les républicains)

        Get-RCDepute -NumCirconscription 5 | where {$_.Groupe -eq 'LR'} | ft

        id Nom      Prenom      Sexe DateNaissance          LieuNaissance                Groupe NomCirconscription numcirco PlaceHemicylce
        -- ---      ------      ---- -------------          -------------                ------ ------------------ -------- --------------
        32 Abad     Damien         H 4/5/1980 12:00:00 AM   Nîmes (Gard)                 LR     Ain                       5             78
        44 Vatin    Pierre         H 8/21/1967 12:00:00 AM  Saint-Quentin (Aisne)        LR     Oise                      5             31
        60 Dubois   Marianne       F 12/17/1957 12:00:00 AM Corbeil-Essonnes (Essonne)   LR     Loiret                    5             20
        146 Grelier  Jean-Carles    H 3/15/1966 12:00:00 AM  Mans (Sarthe)                LR     Sarthe                    5             71
        332 Aubert   Julien         H 6/11/1978 12:00:00 AM  Marseille (Bouches-du-Rhône) LR     Vaucluse                  5            136
        402 Quentin  Didier         H 12/23/1946 12:00:00 AM Royan (Charente-Maritime)    LR     Charente-Maritime         5             28
        408 Brenier  Marine         F 8/11/1986 12:00:00 AM  Nice (Alpes-Maritimes)       LR     Alpes-Maritimes           5            150
        430 Carrez   Gilles         H 8/29/1948 12:00:00 AM  Paris (Paris)                LR     Val-de-Marne              5             92
        475 Genevard Annie          F 9/7/1956 12:00:00 AM   Audincourt (Doubs)           LR     Doubs                     5             90
        526 Huyghe   Sébastien      H 10/25/1969 12:00:00 AM Béthune (Pas-de-Calais)      LR     Nord                      5             43

        .NOTES
            -Version: 2.0
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

    Function NewRCDepute{
        [Cmdletbinding()]
        Param(
            $Entry

        )

        $Collaborateurs = @()
            foreach ($col in $entry.Collaborateurs.Collaborateur){
                    $Collaborateurs += $col
            }

            [Mandat[]]$autresmandats = @()
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

            $SitesWeb = @()

            foreach ($siteWeb in $entry.sites_web.site){
                $SitesWeb +=$siteWeb
            }

            $Identite = [Identite]::New($entry.nom_de_famille,$entry.prenom,$entry.sexe,$entry.date_naissance,$entry.lieu_naissance,$entry.profession)
            $IdentitePolitique = [IdentitePolitique]::new($entry.groupe_sigle,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$Collaborateurs,$entry.parti_ratt_financier,$entry.nb_mandats)
            
            $Contact = [Contact]::new($entry.twitter,$Emails,$SitesWeb)

            return [Depute]::NewDepute().SetId($entry.id).AddIdentite($Identite).AddContact($Contact).AddIdentitePolitique($IdentitePolitique).AddAutresMandats($autresmandats)

    }

    switch ($PsCmdlet.ParameterSetName) {

        "slug"{
            $url = $Rc_data.urls.Deputes.Replace("deputes/enmandat/json",$Slug) + "/json"

            try{
                $entry = (Invoke-RestMethod -Uri $url -ErrorAction Stop).depute
                NewRCDepute -Entry $entry
            }Catch [System.Net.WebException]{
                write-warning "Server indisponible: Merci de vérifier vôtre connection internet."
                break
               
            }Catch{
                $_.exception.message
            }


            
            
            
            #return [Depute]::New($entry.id,$entry.nom_de_famille,$entry.prenom,$entry.groupe_sigle,$entry.date_naissance,$entry.lieu_naissance,$entry.sexe,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$entry.profession,$entry.twitter,$entry.nb_mandats,$entry.parti_ratt_financier,$autresmandats,$Collaborateurs,$Emails)
            Break;
        }
        "id"{

            

            $Entry = (Invoke-RestMethod -Uri $RC_data.urls.deputes).deputes.depute | ? {$_.id -eq $id}

            NewRCDepute -Entry $Entry
            
            break;
        }
        "Nom" {
                $slug = ($prenom +"-"+ $Nom)
                $url = ($RC_data.Urls.Deputes).Replace("deputes/enmandat/json",$slug) + "/json"
                
                $Data = (Invoke-RestMethod -Uri $url).depute
                
                NewRCDepute -Entry $Data

                break;
          }
        "All"{
            $Data = (Invoke-RestMethod -Uri $RC_data.urls.deputes).deputes.depute
            
            Foreach($entry in $data){

                NewRCDepute -Entry $entry

            }

            
            break;
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }



            

}
