Function Get-RCAgenda{
    <#
    .SYNOPSIS
    Recupere l'agenda du parlement (Calendrier Hebdomadaire).
    
    .DESCRIPTION
    Retourne la liste de tous les meetings qui sont plannifiée pour la semaine, ainsi ou il auront lieux, et à quel heure ils commencent.

    Summary                                                               Uid                          Location                                    Start
    -------                                                               ---                          --------                                    -----
    Réunion - Mme Anne GENETET                                            OMC_RUANR5L15S2018IDF0105925 Salon Gabriel, 101, rue de l'Université     20180226T080000Z
    Réunion - M. Luc CARVOUNAS                                            OMC_RUANR5L15S2018IDF0105976 Salle N° 2, 3, rue Aristide Briand          20180226T090000Z
    Réunion - La République en Marche                                     OMC_RUANR5L14S2018IDF0101329 4ème Bureau, Palais Bourbon                 20180226T100000Z
    Réunion - La République en Marche                                     OMC_RUANR5L14S2018IDF0103096 3ème Bureau, Palais Bourbon                 20180226T100000Z
    Réunion - La République en Marche                                     OMC_RUANR5L15S2018IDF0105521 5ème Bureau, Palais Bourbon                 20180226T103000Z
    Réunion - Mme Stéphanie DO                                            OMC_RUANR5L15S2018IDF0106587 Salle N° 23, 3, rue Aristide Briand         20180226T130000Z
    


    .EXAMPLE
    Get-RCAgenda

    Summary                                                               Uid                          Location                                    Start
    -------                                                               ---                          --------                                    -----
    Réunion - Mme Anne GENETET                                            OMC_RUANR5L15S2018IDF0105925 Salon Gabriel, 101, rue de l'Université     20180226T080000Z
    Réunion - M. Luc CARVOUNAS                                            OMC_RUANR5L15S2018IDF0105976 Salle N° 2, 3, rue Aristide Briand          20180226T090000Z
    Réunion - La République en Marche                                     OMC_RUANR5L14S2018IDF0101329 4ème Bureau, Palais Bourbon                 20180226T100000Z


    .NOTES
     -Version: 1.0
     -Author: Stéphane van Gulick 
     -CreationDate: 28/02/2018
     -LastModifiedDate: 01/02/2018
     -History:
        01/02/2018: Creation : Stéphane van Gulick
    #>
    [CmdletBinding()]
    Param(

    )
    
    $url = $rc_data.Urls.Agendas
    $RawContent = (Invoke-WebRequest -URI $url).Content | Out-String
    $Content = [regex]::Split($RawContent,'\n')

    Get-ICSContent -Content $Content

}