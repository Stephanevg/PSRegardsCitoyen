# Regards Citoyen PS

Ce projet est un projet qui permet de fournir à tout citoyen, la possibilité de rechercher des données de la vie politique Française en utilisant Windows PowerShell par le biais de l'API RegardsCitoyen.

Ce projet est une initiative personnel, et n'engage en rien RegardsCitoyens.

Les points décrivent la liste actuel des tâches à faire:

- [X] Get-RCDepute
    - [X] Parametre 'Nom'
    - [X] Paramtre 'Prenom'
    - [X] Recherche par 'Id'
- [X] Get-RCGroupePolitique
    - [X] Parametre 'ListMembre'
    - [X] Parametre 'Nom'
- [ ] Get-RCFonctionParlementaires
    [ ] Creer Class FonctionParlementaire
    [ ] Methode [Depute] GetMembres() 
    [ ] Methode [Depute] GetPresident()
- [ ] Get-RCMissionExtraParlementaires
    [ ] Methode [Depute] GetMembres() 
    [ ] Methode [Depute] GetPresident()
- [ ] Get-RCEtudesEtAmities
    [ ] Methode [Depute] GetMembres() 
    [ ] Methode [Depute] GetPresident()
- [ ] Get-RCCirconscription
- [ ] Get-RCSenateur
- [X] Get-RCSynthese
    - [X] Créer Class [Synthese]
    - [X] Fournir le possibilité de recupérer les données de synthèse pour un mois et une année en particulier
- [ ] Get-RCDonneesDebat (? Get-RCRecherche ?)