# RegardsCitoyenPS

Ce projet est un projet qui permet de fournir à tout citoyen, la possibilité de rechercher des données de la vie politique Française en utilisant Windows PowerShell par le biais de l'API RegardsCitoyen.

Ce projet est une initiative personnel, et n'engage en rien RegardsCitoyens.

Les points décrivent la liste actuel des tâches à faire:

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
