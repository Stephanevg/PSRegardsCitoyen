$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyenPS -Force

Context "Testing Regards Citoyen"{
    Describe "Get-RcSynthese" {

        it "Should not throw an error" {
            {Get-RCSynthese} | should not throw
        }

        it "Should return list of Syntheses (Empty Param)" {
            $obj = Get-RCSynthese

            $obj | should not benullorempty

            $obj.count -gt 2 | should be $true
        }

        it "Should return object of type 'Synthese' (Empty Param)" {
            $obj = Get-RCSynthese

            $r = Get-Random -Minimum 1 -Maximum $obj.count
            $obj[$r].GetType().Name | should be "Synthese"

            
        }

        it "Should return only one object (Param Date '201711' )" {
            $now = Get-Date
            $now.AddMonths(-6)
            $obj = Get-RCSynthese -Date "201711"
            $obj.count -ge 1 | should be $true

        }

        it "Should throw with wrong date format (Param Date '2011' )" {
            {Get-RCSynthese -Date "2011"} | should throw
            

        }

    
    }
    
}

Pop-Location