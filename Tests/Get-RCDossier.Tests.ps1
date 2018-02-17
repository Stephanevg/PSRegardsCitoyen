$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyen -Force

Context "Testing Regards Citoyen"{
    Describe "Get-RCDossier" {

        it "Should not throw an error" {
            {Get-RCDossier} | should not throw
        }

        it "Should return list of Deputes (Empty Param)" {
            $obj = Get-RCDossier

            $obj | should not benullorempty

            $obj.count -gt 2 | should be $true
        }

        it "Should return object of type 'Depute' (Empty Param)" {
            $obj = Get-RCDossier

            $r = Get-Random -Minimum 1 -Maximum $obj.count
            $obj[$r].GetType().Name | should be "Dossier"

            $obj.count -gt 2 | should be $true
        }

        it "Should return only one object (Param 'id' -> '1758'" {
            $Dossier = Get-RCDossier -id 1758
            $Dossier.count | should be 1

        }

        it "Should return right object (Param Prenom -> 'Richard'  Nom -> 'Ferrand' )" {
            $Richou = Get-RCDossier -id 1758
            $Richou.Titre | should be "Lutte contre la désertification médicale"
            $Richou.nbinterventions | should be 294
        }

        it "Param -> -Full: Should return complete object" {
            $Dossier = Get-RCDossier -full
            $Dossier.intervenants | should not benullorempty
            $Dossier.Seances | should not benullorempty
            $Dossier.Documents | should not benullorempty
            $Dossier.SousSections | should not benullorempty
        }
    }
    
}

Pop-Location