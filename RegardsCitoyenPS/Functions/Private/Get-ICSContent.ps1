Function Get-ICSContent{
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$false,ParameterSetName="Path")]
        [ValidateScript({
            Test-Path $_
        })]
        [String]$Path,


        [Parameter(Mandatory=$false,ParameterSetName="Content")]
        [String[]]$Content

        
    )

    Switch($PSCmdlet.ParameterSetName){
        "Path"{
            
            $icsContent = gc $Path
            Break;
        }
        "Content"{

            $icsContent = $Content

            Break;
        }
    }

   
    
    $AllEvents = @()

    Foreach ($Line in $icsContent){
        Switch -Regex ($Line) {
            '^\s+$'{
                #Seperator, ignore
                ;break
            }
            '^BEGIN:VEVENT'{$Properties = @{};break}
            '^UID:(?<UID>.*)'{$Properties.Uid = $Matches.Uid;break}
            '^DTSTART:(?<Start>.*)'{$Properties.Start = $Matches.Start;break}
            '^SUMMARY:(?<Summary>.*)'{$Properties.Summary = $Matches.Summary;break}
            '^LOCATION:(?<Location>.*$)'{$Properties.Location = $Matches.Location;break}
            '^DESCRIPTION:(?<Description>.*$)'{$Properties.Description = $Matches.Description;break}
            '(?<Transparent>^TRANSP:TRANSPARENT)'{Break}#$Properties.Transparent = $Matches.Transparent;break}
            '^END:VEVENT'{$obj = New-Object psobject -Property $properties;$AllEvents += $obj;break}
            Default{}
        }
    }

    Return $AllEvents

}

Get-ICSContent -Content $Content