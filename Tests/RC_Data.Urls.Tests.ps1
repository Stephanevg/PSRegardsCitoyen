$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyen -Force

Context "Testing Regards Citoyen"{
    Describe "RC_Data.Urls" {


        it "RCData: Should not be empty" {
            $rc_data.Urls | should -Not -BeNullOrEmpty
        }

        it "Testing Url: groupePolitique" {
           $rc_data.urls.groupepolitique | should be "https://www.nosdeputes.fr/groupe/json"
            
        }

        it "Testing Url: organisme" {
            
            $rc_data.urls.organisme | should be "https://www.nosdeputes.fr/organismes/groupe/json"  

        }

        it "Testing Url: parlementaire" {
            
            $rc_data.urls.parlementaire | should be "https://www.nosdeputes.fr/organismes/parlementaire/json"
           
        }

        it "Testing Url: extra" {
            
            
            
            $rc_data.urls.extra | should be "https://www.nosdeputes.fr/organismes/extra/json"

        }

        it "Testing Url: groupeetudesetamities" {
            
            
            
            $rc_data.urls.groupeetudesetamities | should be "https://www.nosdeputes.fr/organismes/groupes/json"

        }

        it "Testing Url: synthese" {

            $rc_data.urls.synthese | should be "https://www.nosdeputes.fr/synthese/data/json"

        }

        it "Testing Url: Deputes" {
            

            $rc_data.urls.Deputes | should be "https://www.nosdeputes.fr/deputes/enmandat/json"

        }

         it "Testing Url: Dossiers" {

            $rc_data.urls.Dossiers | should be "https://www.nosdeputes.fr/dossiers/nom/json"

        }
        
    }
}

Pop-Location