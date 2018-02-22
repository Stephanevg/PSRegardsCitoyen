$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyenPS -Force

Context "Testing Regards Citoyen"{
    Describe "Get-RCSeance" {

        it "Empty Param -> Should throw an error" {
            {Get-RCSeance -id } | should throw
        }

        it "Param: id 14 -> Should return list of Interventions" {
            $obj = Get-RCSeance -id 34

            $obj | should not benullorempty

            $obj.count -gt 2 | should be $true
        }

        it "Should return object of type 'Intervention' (Empty Param)" {
            $obj = Get-RCSeance -id 34

            $r = Get-Random -Minimum 1 -Maximum $obj.count
            $obj[$r].GetType().Name | should be "Intervention"

            
        }

        it "Should return only one object (Param ID -> '67')" {
            $Id = Get-RCSeance -Id "67"
            $Id.count | should Not BeNullOrEmpty

        }

        it "Should return right object type [Intervention] (Param ID -> '67' )" {
            $Id = Get-RCSeance -Id "67"
            $id[0].getType().Name | should be "Intervention"
        }
    }
    
}

Pop-Location