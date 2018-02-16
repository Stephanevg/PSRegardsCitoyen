$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyen -Force

Context "Testing Regards Citoyen"{
    Describe "Get-RCSeance" {

        it "Should not throw an error" {
            {Get-RCSeance} | should not throw
        }

        it "Should return list of Interventions (Empty Param)" {
            $obj = Get-RCSeance

            $obj | should not benullorempty

            $obj.count -gt 2 | should be $true
        }

        it "Should return object of type 'Intervention' (Empty Param)" {
            $obj = Get-RCSeance

            $r = Get-Random -Minimum 1 -Maximum $obj.count
            $obj[$r].GetType().Name | should be "Intervention"

            
        }

        it "Should return only one object (Param ID -> '67')" {
            $Id = Get-RCSeance -Id "67"
            $Id.count | should Not BeNullOrEmpty

        }

        it "Should return right object type [Intervention] (Param ID -> '67' )" {
            $Id = Get-RCSeance -Id "67"
            $id[0].Titre -eq "réunion du 19 juillet 2017 à 11h15" | should be $true
        }
    }
    
}

Pop-Location