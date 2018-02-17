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
    [Mandat[]]$autresmandats
    [String[]]$Collaborateurs
    [String[]]$Emails
   

    Depute([int]$id,[String]$Nom,[String]$Prenom,[String]$Groupe){
        $this.Nom = $Nom
        $This.Prenom = $Prenom
        $This.Groupe = $Groupe
    }
    Depute([int]$id,[String]$Nom,[String]$Prenom,[String]$Groupe,[DateTime]$DateNaissance,[String]$LieuNaissance,[Sexe]$Sexe,[string]$nomcirco,[int]$numcirco,[int]$PlaceHemicylce,[DateTime]$DebutDeMandat,[String]$Profession,[string]$Twitter,[int]$NbMandats,[string]$partirattfinancier,[Mandat[]]$autresmandats,[string[]]$Collaborateurs,[string[]]$Emails){
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
        $this.autresmandats = $autresmandats
        $this.Collaborateurs = $Collaborateurs
        $this.Emails = $Emails

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

Class Dossier {
    [int]$id
    [string]$Titre
    [Datetime]$MinDate
    [DateTime]$MaxDate
    [int]$NbInterventions
    [Depute[]]$Intervenants
    [Intervention[]]$Seances
    [String[]]$Documents
    [String[]]$SousSection
    hidden [string[]]$Id_intervenants
    hidden [string[]]$id_seances
    hidden [int[]]$id_documents
    hidden [int[]]$id_soussections


    Dossier([int]$id,[String]$Titre,[int]$NbInterventions,[DateTime]$minDate,[DateTime]$MaxDate,[string[]]$Id_intervenants,[String[]]$id_seances,[int[]]$id_documents,[int[]]$id_soussections){
        $this.id = $id
        $this.Titre = $Titre
        $this.NbInterventions = $NbInterventions
        $this.MinDate = $minDate
        $this.MaxDate = $MaxDate
        $this.Id_intervenants = $Id_intervenants
        $this.id_documents = $id_documents
        $this.id_seances = $id_seances
        $this.id_soussections = $id_soussections
    }
    
    hidden [Void] _LoadIntervenants(){
        
        write-verbose "Chargement des seances.."

        if ($this.Id_intervenants){
            $inter += @()
            foreach ($Id in $this.Id_intervenants){

                $inter += Get-RCDepute -Slug $id

            }

            $this.Intervenants = $inter  
        }

    }

    hidden [void] _LoadSeances(){
        write-verbose "Chargement des seances.."
        if ($this.id_seances){
            $Interventions += @()
            foreach ($id in $this.id_seances){

                $Interventions += Get-RCSeance -id $id

            }

            $this.Seances = $Interventions  
        }
        
        
    }

    hidden [Void] _LoadDocuments(){

        write-verbose "Chargement des seances.."
        if ($this.id_documents){
            $Docs += @()
            foreach ($id in $this.id_documents){

                $Docs += Get-RCDocument -id $id

            }

            $this.Documents = $Docs  
        }
        
        
    }

    [Void] _LoadSousSections(){

        write-verbose "Chargement des seances.."
        if ($this.id_soussections){
            $soussec += @()
            foreach ($id in $this.id_soussections){

                $soussec += Get-RCSousSection -id $id

            }

            $this.SousSection = $soussec  
        }
         
    }

    [Dossier] Full(){
        $this._LoadSeances()
        $this._LoadDocuments()
        $this._LoadIntervenants()
        $this._LoadSousSections()
        return $this
    }

}

Class Mandat {
    [String]$Commune
    [String]$Entite
    [String]$Fonction

    Mandat([String]$Commune,[String]$Entite,[String]$Fonction){
        $this.Commune = $Commune
        $this.Entite = $Entite
        $This.Fonction = $Fonction
    }
}

Class Circonscription {
    $Nom
    $Num

    Circonscription ([String]$Nom,[Int]$Num){
        $this.nom = $Nom
        $this.num = $Num
    }
}

Class Intervention {
    [int]$id
    [string]$Titre
    [String]$Lieu
    [DateTime]$Date
    [String]$Type
    [String]$Section
    [String]$SousSection
    [String]$NomIntervenant
    hidden [String]$slugIntervenant
    [String]$Contenu
    [String]$tags
    [String]$Amendements
    [Int[]]$Loi

    Intervention ([Int]$Id,[String]$Titre,[String]$Lieu,[DateTime]$Date,[String]$Type,[String]$Section,[String]$SousSection,[String]$NomIntervenant,[String]$SlugIntervenant,[String]$Contenu,[String]$Tags,[String]$Amendements,[int[]]$Loi){
        $this.id = $Id
        $this.Titre = $Titre
        $this.Lieu = $Lieu
        $this.Date = $Date
        $this.Type = $Type
        $this.Section = $Section
        $this.SousSection = $SousSection
        $this.NomIntervenant = $NomIntervenant
        $this.slugIntervenant = $SlugIntervenant
        $this.Contenu = $Contenu
        $this.tags = $Tags
        $this.Amendements = $Amendements
        $this.Loi = $Loi
    }
}

Class Document {
    [int]$id
    [String]$titre
    [string]$nbcommentaires
    [String]$legislature
    [string]$annexe
    [String]$Type
    [String]$typeDetails
    [String]$Categorie
    [String]$iddossieran
    [datetime]$Date
    hidden[String]$Sourceurl
    [String]$organismeid
    [string]$Signataires
    [String]$Contenue
    hidden[String]$urlNosDeputes

    Document ([int]$id,[String]$titre,[String]$nbcommentaires,[string]$legislature,[string]$annexe,[string]$type,[String]$typeDetails,[String]$Categorie,[string]$iddossieran,[datetime]$date,[string]$Sourceurl,[String]$organismeid,[string]$Signataires,[string]$Contenue,[string]$urlNosDeputes){
    
        $this.id = $id
        $this.titre = $titre
        $this.nbcommentaires = $nbcommentaires
        $this.legislature = $legislature
        $this.annexe =$annexe
        $this.Type = $type
        $this.typeDetails = $typeDetails
        $this.Categorie = $Categorie
        $this.iddossieran = $iddossieran
        $this.Date = $date
        $this.Sourceurl = $Sourceurl
        $this.organismeid = $organismeid
        $this.Signataires= $Signataires
        $this.Contenue = $Contenue
        $this.urlNosDeputes = $urlNosDeputes
    }
}