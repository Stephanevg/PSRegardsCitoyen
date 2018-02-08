Enum Parti {
    NI = 0
    GDR = 1
    LFI = 2
    LREM = 3
    LC = 4
    LR = 5
    MODEM = 6
    NG = 7
    UAI = 8
}

Enum Sexe {
    NC = 0
    F = 1
    H = 2
}

Class GroupePolitique {
    [int]$id
    [string]$Slug
    [string]$Nom
    [string]$Acronyme
    [string]$GroupeActuel
    [string]$Couleur
    [string]$Type
    [string]$Order
    [string]$urlNosDeputes
    hidden [string]$urlNosDeputesAPI
    
    GroupePolitique([int]$id,[string]$slug,[string]$nom,[string]$Acronyme,[string]$GroupeActuel,[string]$Couleur,[String]$Order,[string]$Type,[string]$urlNosDeputes,[string]$urlNosDeputesAPI){
        $this.id = $id
        $this.Slug = $slug
        $this.nom = $nom
        $this.Acronyme = $Acronyme
        $this.GroupeActuel = $GroupeActuel
        $this.Couleur = $Couleur
        $this.order = $Order
        $this.type = $type
        $this.urlNosDeputes = $urlNosDeputes   
        $this.urlNosDeputesAPI = $urlNosDeputesAPI
    }

    
}

Class Depute{
    [int]$id
    [String]$Nom
    [String]$Prenom
    [Sexe]$Sexe
    [DateTime]$DateNaissance
    [String]$LieuNaissance
    [String]$Groupe
    [String]$NomCirconscription
    [int]$numcirco
    [int]$PlaceHemicylce
    [DateTime]$DebutDeMandat
    [String]$Profession
    [String]$Twitter
    [int]$NombreDeMandats
    [String]$partirattfinancier
   

    Depute([int]$id,[String]$Nom,[String]$Prenom,[String]$Groupe){
        $this.Nom = $Nom
        $This.Prenom = $Prenom
        $This.Groupe = $Groupe
    }
    Depute([int]$id,[String]$Nom,[String]$Prenom,[String]$Groupe,[DateTime]$DateNaissance,[String]$LieuNaissance,[Sexe]$Sexe,[string]$nomcirco,[int]$numcirco,[int]$PlaceHemicylce,[DateTime]$DebutDeMandat,[String]$Profession,[string]$Twitter,[int]$NbMandats,[string]$partirattfinancier){
        $this.id = $id
        $this.Nom = $Nom
        $This.Prenom = $Prenom
        $This.Groupe = $Groupe
        $this.DateNaissance = $DateNaissance
        $this.LieuNaissance = $LieuNaissance
        $This.Sexe = $Sexe
        $this.NomCirconscription = $nomcirco
        $this.numcirco = $numcirco
        $this.PlaceHemicylce = $PlaceHemicylce
        $this.Profession = $Profession
        $This.Twitter = $Twitter
        $this.DebutDeMandat = $DebutDeMandat
        $this.NombreDeMandats = $NbMandats
        $this.partirattfinancier = $partirattfinancier

    }
}

Class Synthese{
    [int]$id
    [String]$Nom
    [String]$Groupe
    [int]$AmendementsAdoptes
    [int]$AmendementsProposes
    [int]$AmendementsSignes
    [int]$CommisionInterventions
    [int]$CommisionPresences
    [int]$hemicycleInterventions
    [int]$hemicycleInterventionsCourtes
    [int]$PropositionEcrites
    [int]$PropositionsSignees
    [int]$QuestionsEcrites
    [int]$QuestionsOrales
    [int]$Rapports
    [int]$SemainesPresence
   

    Synthese([int]$id,[String]$Nom,[String]$Groupe,[int]$AmendementsAdoptes,[int]$AmendementsProposes,[int]$AmendementsSignes,[int]$CommisionInterventions,[int]$CommisionPresences,[int]$hemicycleInterventions,[int]$hemicycleInterventionsCourtes,[int]$PropositionEcrites,[int]$PropositionsSignees,[int]$QuestionsEcrites,[int]$QuestionsOrales,[int]$Rapports,[int]$SemainesPresence){
        $this.id = $id
        $this.Nom = $Nom
        $This.Groupe = $Groupe
        $This.AmendementsAdoptes = $AmendementsAdoptes
        $This.AmendementsProposes = $AmendementsProposes
        $This.AmendementsSignes = $AmendementsSignes
        $This.CommisionInterventions = $CommisionInterventions
        $This.CommisionPresences = $CommisionPresences
        $This.hemicycleInterventions = $hemicycleInterventions
        $This.hemicycleInterventionsCourtes = $hemicycleInterventionsCourtes
        $This.PropositionEcrites = $PropositionEcrites
        $This.PropositionsSignees = $PropositionsSignees
        $This.QuestionsEcrites = $QuestionsEcrites
        $This.QuestionsOrales = $QuestionsOrales
        $This.Rapports = $Rapports
        $This.SemainesPresence = $SemainesPresence
    }
    
}

Class ProjetDeLoi {
    [int]$id
    [string]$Titre
    [Datetime]$MinDate
    [DateTime]$MaxDate
    [int]$NbInterventions
    [Depute[]]$Intervenants
    [String]$Seances
    [String[]]$Documents
    [String[]]$SousSection
    [String[]]$Sceances

    ProjetDeLoi([int]$id,[String]$Titre,[int]$NbInterventions,[DateTime]$minDate,[DateTime]$MaxDate){
        $this.id = $id
        $this.Titre = $Titre
        $this.NbInterventions = $NbInterventions
        $this.MinDate = $minDate
        $this.MaxDate = $MaxDate
        
    }

}