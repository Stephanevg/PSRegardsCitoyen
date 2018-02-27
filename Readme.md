# RegardsCitoyenPS

## BuildStatus
|Type|Status|
|---|---|
| Overall  | [![Build status](https://ci.appveyor.com/api/projects/status/l96c3v2raggh1unv?svg=true)](https://ci.appveyor.com/project/Stephanevg/regardscitoyenps)  |
| Master  | [![Build status](https://ci.appveyor.com/api/projects/status/l96c3v2raggh1unv/branch/master?svg=true)](https://ci.appveyor.com/project/Stephanevg/regardscitoyenps/branch/master)

> Pour rapporter un bug, ou pour suggérer une fonctionnalité, merci de créer une nouvelle _**issue**_ sur [Github Issues](https://github.com/Stephanevg/RegardsCitoyenPS/issues)

# Introduction

RegardsCitoyenPS est un projet qui permet de fournir à tout citoyen, la possibilité de rechercher des données de la vie politique Française en utilisant Windows PowerShell par le biais de l'API RegardsCitoyen.

(Ce projet est une initiative personnel, et n'engage en rien RegardsCitoyens.)

## Installation

l'installation est simple et rapide. Il suffit d'ouvrir une fenêtre powershell en tant qu'administrateur et d'executer la commande suivante:

```Powershell

Install-Module RegardsCitoyenPS -Force

```

L'installation devrait pas prendre plus de quelques secondes.

## Actions de base

### Lister toutes les commandes disponible du module

```Powershell

C:\WINDOWS\system32 > get-command -Module RegardsCitoyenPS

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-RCDepute                                       0.6.2.0    RegardsCitoyenPS
Function        Get-RCDocument                                     0.6.2.0    RegardsCitoyenPS
Function        Get-RCDossier                                      0.6.2.0    RegardsCitoyenPS
Function        Get-RCGroupePolitique                              0.6.2.0    RegardsCitoyenPS
Function        Get-RCIntervention                                 0.6.2.0    RegardsCitoyenPS
Function        Get-RCOrganismeExtraParlementaire                  0.6.2.0    RegardsCitoyenPS
Function        Get-RCOrganismeParlementaire                       0.6.2.0    RegardsCitoyenPS
Function        Get-RCSeance                                       0.6.2.0    RegardsCitoyenPS
Function        Get-RCSynthese                                     0.6.2.0    RegardsCitoyenPS
Function        Invoke-RCRecherche                                 0.6.2.0    RegardsCitoyenPS

```

Comme vous povez le voir, toutes commandes (appelées Cmdlets) sont préfixes des lettres "RC", qui est l'abréviation de "RegardsCitoyen.

### Trouver de l'aide sur une commande en particulier:

```Powershell

Get-Help <Nom-de-commande>

```

Par exemple, afin d'obtenir de l'aide sur le fonctionnement de `Get-RCDepute`, il suffit de tapper: 

```Powershell

Get-Help Get-RCDepute

```

Il est possible d'avoir des exemples d'utilisation en utilisant le paramètre `-Examples`

```Powershell

Get-Help Get-RCDepute -Examples

```

Ou bien encore l'aide en détail d'une commande avec le paramètre `-Detailed`

```Powershell

Get-Help Get-RCDepute -Examples

```

## Decouverte du module RegardsCitoyenPS

### Lister tous les députés actuellement en mandat

```Powershell

Get-RCDepute

```

Cette commande retournera un résultat similaire à ceci:

``` PowerShell

        id                 : 1
        Nom                : Roussel
        Prenom             : Cédric
        Sexe               : H
        DateNaissance      : 10/10/1972 12:00:00 AM
        LieuNaissance      : Brest (Finistère)
        Groupe             : LREM
        NomCirconscription : Alpes-Maritimes
        numcirco           : 3
        PlaceHemicylce     : 309
        DebutDeMandat      : 6/21/2017 12:00:00 AM
        Profession         : Conseiller en gestion de patrimoine indépendant
        Twitter            : CedricRoussel06
        NombreDeMandats    : 1
        partirattfinancier : En marche !
        autresmandats      : {}
        Collaborateurs     : {Mme Tiffany Palanque, Mme Camilia M'Hamed-Said, Mme Morgane Reclus}
        Emails             : {cedric.roussel@assemblee-nationale.fr, 6circo03@en-marche.fr}

        id                 : 2
        Nom                : Hai
        Prenom             : Nadia
        Sexe               : F
        DateNaissance      : 3/8/1980 12:00:00 AM
        LieuNaissance      : Trappes (Yvelines)
        Groupe             : LREM
        NomCirconscription : Yvelines
        numcirco           : 11
        PlaceHemicylce     : 349
        DebutDeMandat      : 6/21/2017 12:00:00 AM
        Profession         : Autre cadre (secteur privé)
        Twitter            : NadiaHai78
        NombreDeMandats    : 1
        partirattfinancier : En marche !
        autresmandats      : {}
        Collaborateurs     : {Mme Nelly Guého, M. Moussa Ouarouss, Mme Feriel Herlaut, Mme Moufida Goucha}
        Emails             : {nadia.hai@en-marche.fr, nadia.hai@assemblee-nationale.fr}

        (...)


```


### Avoir la liste de tous les groupe politiques Français

```Powershell

Get-RCGroupPolitique

```

### Avoir la liste de tous les députés membre d'un groupe politiques Français bien précis

```Powershell

Get-RCGroupPolitique -Acronyme LR -ListMembres

```

(Retourne tous les députés membres du groupe 'les républicains')

### Avoir la liste de tous les dossiers qui sont actuellement discuté à l'assemblée nationale

```Powershell

Get-RCDossier

```

Afin de faciliter la visualisation, il est conseillerer d'utiliser 'Format-Table'

```Powershell

Get-RCDossier | Format-Table

```


### Retourner le detail d'un dossier en particulier (par ID)

Par exmemple, ID 167 qui reference le dossier "Confiance dans la vie politique".

``` PowerShell
    Get-RCDossier -id 167
```

A des fins d'optimisation, pas toutes les données sont directement retournés. Pour avoir accès a toutes les données, il faut utiliser le parametre "-Full"

``` PowerShell
    Get-RCDossier -id 167 -Full
```

En fonction du dossier, ceci peut durer plus ou moins longtemps. Comme le dossier concernant "la confiance dans la vie politique" à été très discuté, il y a eu beaucoup de documents / interventions produits, venant de beacoup d'intervenants (députés) different. Donc il sera un peu long à charger.

# Liens

|Site|Description|
|---|---|
| [PowerShellDistrict.com](http://www.powershelldistrict.com/introduction-regardscitoyenps) | Blog de l'auteur (Stéphane van Gulick) contenant des details techniques sur le projet RegardsCitoyenPS |
|[Assemblee-Nationale.fr](http://www.assemblee-nationale.fr/)| Site officiel de l'assemblée Nationale |
|[Senat.fr](http://www.senat.fr/)| Site officiel de du sénat |
|[RegardsCitoyens.Org](http://www.regardscitoyens.org/)| Site officiel de Regards Citoyen |
|[Nosdeputes.fr](http://www.nosdeptues.fr/)| Site officiel de "nosdéputes.fr" |
|[Page Github de Nos députes](https://github.com/regardscitoyens/nosdeputes.fr/blob/master/doc/api.md)| Page github expliquant le fonctionnement de l'API de RegardsCitoyen.org  |
| | |
## Tâches


- [ ] Migrer la liste des tâches à faire dans Github Issues
- [X] Get-RCDepute
    - [X] Parametre 'Nom'
    - [X] Paramtre 'Prenom'
    - [X] Recherche par 'Id'
    - [X] Parametre Circonscription
    - [X] Parametre NumDepartement
    - [X] Parametre NomDepartement
- [X] Get-RCGroupePolitique
    - [X] Parametre 'ListMembre'
    - [X] Parametre 'Nom'
- [X] Get-RCOrganismeParlementaire
    - [ ] Ecrire Pester Test Get-RCOrganismeParlementaire.Tests.ps1
    - [X] Creer Class Organisme
    - [X] Methode [Depute] GetMembres() 
    - [ ] Methode [Depute] GetPresident() 
        --> CEci va nécessité la création d'une class 'Membre' qui hériterais de [Depute] avec les propriétés supp suivants:
            --> fonction
            --> Debut fonction
- [X] Get-RCOrganismeExtraParlementaire
    - [X] Methode [Depute] GetMembres() 
    - [ ] Methode [Depute] GetPresident()
    - [ ] Create Pester Test
- [ ] Get-RCEtudesEtAmities
    - [ ] Methode [Depute] GetMembres() 
    - [ ] Methode [Depute] GetPresident()
- [ ] Get-RCSenateur
- [X] Get-RCSynthese
    - [X] Créer Class [Synthese]
    - [X] Fournir le possibilité de recupérer les données de synthèse pour un mois et une année en particulier
- [X] Invoke-RCRecherche
    - [X] Implemente Query (Text Libre)
    - [X] Implementation de query aidé (Via Params)
    - [ ] Pester Tests
- [X] Get-RCDossier -> http://www.assemblee-nationale.fr/15/documents/index-dossier.asp
    - [X] Parametre ID
    - [X] Parametre Full (Recuperation des données Documents, Intervenants,Seance, sousSections via ID/slug)
    - [X] Class Dossier
        - [X] _LoadSceances
        - [X] LoadDocuments
        - [X] _LoadIntervenants()
            - [ ] GetInterventions()
                Retourne les interventions d'un député en mémoire. (Trop complexe?)
- [X] Get-RCDocument
    - [X] ID
    - [ ] No Param (List tous les Documents) -> Depends sur Get-RCRecherche
    - [X] Class Document
- [X] Get-RCSceance
   - [X] Class Sceance (Array d'interventions)
- [X] Class Intervention
- [X] Class Mandat
- [X] Analyse pour Cmdlet GetRCRecherche
- [ ] Class Intervenant (Hérite de Depute)
    - [ ] Update toutes les cmdlets suivants:
        - [ ] Get-RCDossier
- [X] Improve Error handling
- [ ] Documentation
    - [X] about_RegardsCitoyenPs
    - [X] Get-RCDepute
    - [ ] Get-RCDocument
    - [ ] Get-RCDossier
    - [ ] Get-RCGroupePolitique
    - [ ] Get-RCSeance
    - [ ] Get-RCSynthese
    - [ ] Invoke-RCRecherche
