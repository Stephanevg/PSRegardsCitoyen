$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyenPS -Force

Context "Testing Regards Citoyen"{
    Describe "Get-RCDocument" {

        it "Should not throw an error" {
            {Get-RCDocument -id 45} | should not throw
        }

        it "Calling with (Empty Param)" {
            {Get-RCDocument -id} | should throw

        }


        it "Should return only one object (Param 'id' -> '411'" {
            $Dossier = Get-RCDocument -id 411
            $Dossier.count | should be 1

        }

        it "Should return right object (Param ID -> '1758')" {
            $doc = Get-RCDocument -id 1758
            $doc.iddossieran | should be "potentiel_systeme_apprentissage_France"
            
        }

        it "Param -> -Full: Should return complete object" {
            $Dossier = Get-RCDocument -id 411
            $Dossier.id | should not benullorempty
            $Dossier.titre | should not benullorempty
            $Dossier.contenue | should not benullorempty
            $Dossier.type | should be "Proposition de loi"
        }
    }
    
}

Pop-Location