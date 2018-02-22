$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyenPS -Force

Context "Testing Regards Citoyen"{
    Describe "Invoke-RCRecherche" {

        it "Should throw an error" {
            {Invoke-RCRecherche -type} | should throw
        }

        it "Should return list at least 2 results" {
            $obj = Invoke-RCRecherche -Type Texteloi -Text "cumul" -limit 7 -Format json

            $obj | should not benullorempty

            $obj.count -gt 2 | should be $true
        }


        it "Param: Raw" {

            $obj = Invoke-RCRecherche -Type Texteloi -Text "cumul" -limit 7 -Raw

        }

        it "Param: ObjectType" {

            $obj = Invoke-RCRecherche -Type Texteloi -Text "cumul" -limit 7

        }

        it "PAram: Limit" {

            $obj = Invoke-RCRecherche -Type Texteloi -Text "cumul" -limit 7 -Raw

        }

        it "Param: Format XML" {

            $obj = Invoke-RCRecherche -Type Texteloi -Text "cumul" -limit 7 -Format XML

        }

        it "PAram: CSV" {

            $obj = Invoke-RCRecherche -Type Texteloi -Text "cumul" -limit 2 -Format CSV

        }

        it "Param: JSON" {

            $obj = Invoke-RCRecherche -Type Texteloi -Text "cumul" -limit 2 -Format JSON

        }

        
    }
    
}

Pop-Location