$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyenPS -Force

Context "Testing Regards Citoyen"{
    Describe "Get-RCDossier" {

        it "Empty Param -> Should throw an error" {
            {Get-RCDossier -id} | should throw
        }

        it "Should return list of Deputes" {
            $obj = Get-RCDossier -id 49

            $obj | should not benullorempty

        }

        it "Should return object of type 'Depute'" {
            $obj = Get-RCDossier -id 49

            $obj.GetType().Name | should be "Dossier"

        }

        it "Should return only one object (Param 'id' -> '1758'" {
            $Dossier = Get-RCDossier -id 1758
            $Dossier.count | should be 1

        }

        it "Should return right object -> Lutte contre la désertification médicale" {
            $Doc = Get-RCDossier -id 1759
            $Doc.Titre | should be "Discussion d'une proposition de loi"
            
        }

        it "Param -> -Full: Should return complete object" {
            $Dossier = Get-RCDossier -id 123 -Full
            $Dossier.intervenants | should not benullorempty
            $Dossier.Seances | should not benullorempty
            $Dossier.Documents | should not benullorempty
            
            #Il semblerais que SousSection ne soit pas encore implementer chez RegardCitoyen.
            #$Dossier.SousSections | should not benullorempty
        }
    }
    
}

Pop-Location