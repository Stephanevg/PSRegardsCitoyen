$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyen -Force

Context "Testing Regards Citoyen"{
    Describe "Get-RCDepute" {

        it "Should not throw an error" {
            {Get-RCDepute} | should not throw
        }

        it "Should return list of Deputes (Empty Param)" {
            $obj = Get-RCDepute

            $obj | should not benullorempty

            $obj.count -gt 2 | should be $true
        }

        it "Should return object of type 'Depute' (Empty Param)" {
            $obj = Get-RCDepute

            $r = Get-Random -Minimum 1 -Maximum $obj.count
            $obj[$r].GetType().Name | should be "Depute"

            $obj.count -gt 2 | should be $true
        }

        it "Should return only one object (Param Prenom -> 'Richard'  Nom -> 'Ferrand' )" {
            $Richou = Get-RCDepute -Nom "Ferrand" -Prenom "Richard"
            $Richou.count | should be 1

        }

        it "Should return right object (Param Prenom -> 'Richard'  Nom -> 'Ferrand' )" {
            $Richou = Get-RCDepute -Nom "Ferrand" -Prenom "Richard"
            $Richou.Prenom -eq "Richard" | should be $true
            $Richou.Nom -eq "Ferrand" | should be $true
        }

        it "Param NumDepartement 67" {
            $dep = Get-RCDepute -NumDepartement 67
            $dep | should not benullorempty
            
        }

        it "Param NomCirconscription 'Haut-Rhin'" {
            $dep = Get-RCDepute -NumDepartement 67
            $dep | should not benullorempty
            
        }

        it "Param NumCirconscription 5" {
            $dep = Get-RCDepute -NumDepartement 67
            $dep | should not benullorempty
            
        }
    }
    
}

Pop-Location