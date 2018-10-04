[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingCmdletAliases", "")]

param (
    [Parameter(Mandatory = $true)]
    $ImageName,

    $Here = (Split-Path -Parent $MyInvocation.MyCommand.Path),
    $ModulesPath = (Join-Path $Here "Modules")
)

Import-Module (Join-Path $ModulesPath 'TestDrive.psm1') -Force


Describe "Pandoc image" {
    Context "from markdown" {
        $input = New-TestDriveFile 'input.markdown' @"
Hello *pandoc*!

- one
- two
"@

        $volumePath = "C:\Volume"
        $volumeFile = Join-Path $volumePath $input.File
        $docker = @(
            'run',
            '-v', "$($TestDrive):$($volumePath)"
            $ImageName
        )

        It "generates HTML" {
            $resultFileName = 'output.html'
            $pandoc = @(
                '-f', 'markdown'
                '-t', 'html',
                $volumeFile,
                '-o', (Join-Path $volumePath $resultFileName)
            )
            $arguments = $docker + $pandoc

            Write-Host "> docker $($arguments -join ' ')"
            & docker $arguments |
                Write-Host

            $LASTEXITCODE |
                Should -Be 0
            $resultFile = Join-Path $TestDrive $resultFileName
            $resultFile |
                Should -Exist
            $resultFile |
                Should -FileContentMatchExactly '<p>Hello <em>pandoc</em>!</p>' 
            $resultFile |
                Should -FileContentMatchExactly '<li>two</li>' 
        }

        It "generates standalone HTML" {
            Write-Error "TODO: implement test case"
        }

        It "generates Word" {
            Write-Error "TODO: implement test case"
        }

        It "generates ePUB" {
            Write-Error "TODO: implement test case"
        }
    }
}
