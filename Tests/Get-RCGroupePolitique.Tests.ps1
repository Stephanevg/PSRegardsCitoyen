$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyenPS -Force

Context "Testing Regards Citoyen"{
    Describe "Get-RCGroupePolitique" {

        it "Should not throw an error" {
            {Get-RCGroupePolitique} | should not throw
        }

        it "Should return list of Groupes (Empty Param)" {
            $obj = Get-RCGroupePolitique

            $obj | should not benullorempty

            $obj.count -gt 2 | should be $true
        }

        it "Should return object of type 'GroupePolitique' (Empty Param)" {
            $obj = Get-RCGroupePolitique

            $r = Get-Random -Minimum 1 -Maximum $obj.count
            $obj[$r].GetType().Name | should be "GroupePolitique"

            
        }

        it "Should return only one object (Param Nom 'UAI' )" {
            $Groupe = Get-RCGroupePolitique -Acronyme "UAI"
            $Groupe.count | should be 1

        }

        it "Should return right object (Param Nom 'UAI')" {
            $Groupe = Get-RCGroupePolitique -Acronyme "UAI"
            $Groupe.Acronyme -eq "UAI" | should be $true
            
        }

        it "Should return List members (Param -Nom 'UAI' -ListMembre)" {
            $Groupe = Get-RCGroupePolitique -Acronyme "UAI" -ListMembre
            $Groupe.count -gt 1 | should be $true
            
        }

        it "Should return List members of type 'Depute' (Param -Nom 'UAI' -ListMembre)" {
            $Groupe = Get-RCGroupePolitique -Acronyme "UAI" -ListMembre
            $r = Get-Random -Minimum 1 -Maximum $Groupe.count
            $Groupe[$r].GetType().Name | should be "Depute"
            
        }
    }
    
}

Pop-Location