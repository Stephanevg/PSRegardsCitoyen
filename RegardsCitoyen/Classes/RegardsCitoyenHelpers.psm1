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
   

    Depute([String]$Nom,[String]$Prenom,[String]$Groupe){
        $this.Nom = $Nom
        $This.Prenom = $Prenom
        $This.Groupe = $Groupe
    }
    Depute([String]$Nom,[String]$Prenom,[String]$Groupe,[DateTime]$DateNaissance,[String]$LieuNaissance,[Sexe]$Sexe,[string]$nomcirco,[int]$numcirco,[int]$PlaceHemicylce,[DateTime]$DebutDeMandat,[String]$Profession,[string]$Twitter,[int]$NbMandats,[string]$partirattfinancier){
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

