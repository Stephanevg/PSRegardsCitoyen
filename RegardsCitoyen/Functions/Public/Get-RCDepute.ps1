Function Get-RCDepute {
    <#
    .SYNOPSIS
    #Recupere des donnÃ©es statitques d'un ou plusieurs dÃ©putÃ©(s)
    
    .DESCRIPTION
    Permet de rÃ©cuperer des donnÃ©es statitiques des reprÃ©sentants politique FranÃ§ais.
    
    .PARAMETER Type
    Parameter description
    
    .PARAMETER Valeur
    Parameter description
    
    .PARAMETER DetailsDe
    Parameter description
    
    .EXAMPLE
    Get-RCDepute -Type Fillon -Valeur menuel -DetailsDe

    .EXAMPLE
    Get-RCDepute -Type Circonscription -Valeur Haut-Rhin | select nom,Sexe,Groupe_sigle
    
    .NOTES
    General notes
    #>


    [cmdletBinding(DefaultParameterSetName="all")]
    Param(

        [Parameter(Mandatory=$true,ParameterSetName="Nom")]
        [String]$Nom,

        [Parameter(Mandatory=$true,ParameterSetName="Nom")]
        [String]$Prenom
     
    )


    switch ($PsCmdlet.ParameterSetName) {
        "Nom" {
                $slug = ($prenom +"-"+ $Nom)
                $url = ($RC_data.Urls.Deputes).Replace("deputes/json",$slug) + "/json"
                
                $Data = (Invoke-RestMethod -Uri $url).depute
                #Depute([String]$Nom,[String]$Prenom,[String]$Groupe,[DateTime]$DateNaissance,[String]$LieuNaissance,[Sexe]$Sexe,[string]$nomcirco,[int]$numcirco,[int]$PlaceHemicylce,[DateTime]$DebutDeMandat,[String]$Profession,[string]$Twitter,[int]$NbMandats){
                return [Depute]::New($data.nom_de_famille,$data.prenom,$data.groupe_sigle,$data.date_naissance,$Data.lieu_naissance,$data.sexe,$data.nom_circo,$data.num_circo,$data.place_en_hemicycle,$data.mandat_debut,$data.profession,$data.twitter,$data.nb_mandats,$data.parti_ratt_financier)
                break;
          }
        "All"{
            $Data = (Invoke-RestMethod -Uri $RC_data.urls.deputes).deputes.depute
    
            Foreach ($entry in $Data){
                
                [Depute]::New($entry.nom_de_famille,$entry.prenom,$entry.groupe_sigle,$entry.date_naissance,$entry.lieu_naissance,$entry.sexe,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$entry.profession,$entry.twitter,$entry.nb_mandats,$entry.parti_ratt_financier)
            }
            break;
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }




}
