# Regards Citoyen PS

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
- [ ] Get-RCMissionExtraParlementaires
    - [ ] Methode [Depute] GetMembres() 
    - [ ] Methode [Depute] GetPresident()
- [ ] Get-RCEtudesEtAmities
    - [ ] Methode [Depute] GetMembres() 
    - [ ] Methode [Depute] GetPresident()
- [ ] Get-RCSenateur
- [X] Get-RCSynthese
    - [X] Créer Class [Synthese]
    - [X] Fournir le possibilité de recupérer les données de synthèse pour un mois et une année en particulier
- [ ] Get-RCDonneesDebat (? Get-RCRecherche ?)
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
    - [X] Class Document
- [X] Get-RCSceance
   - [X] Class Sceance (Array d'interventions)
- [X] Class Intervention
- [X] Class Mandat
- [ ] Analyse pour Cmdlet GetRCRecherche

- [ ] Error handling pour les cas ou PAS de connection internet est dispo.
