$TestsPath = Split-Path $MyInvocation.MyCommand.Path

#$FunctionsPath = join-Path -Path (get-item $TestsPath).Parent -ChildPath "Functions"

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Write-Verbose "Importing module"

import-module .\RegardsCitoyenPS -Force

Context "Testing Regards Citoyen"{
    Describe "Get-ICSContent" {

        it 'Get-ICSContent -Content should not fail'{

            $ics = @"
BEGIN:VEVENT
UID:OMC_RUANR5L15S2018IDF0105962
DTSTART:20180305T083000Z
SUMMARY:Réunion - M. Pierre-Yves BOURNAZEL
LOCATION:Sully 3, Palais Bourbon
TRANSP:TRANSPARENT
END:VEVENT
"@

            $Agenda = Get-ICSContent -Content $ics
            $Agenda | should not benullorEmpty
        }
        
    }

    
    
}

Pop-Location