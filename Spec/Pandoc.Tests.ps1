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

        It "generates HTML" {
            Write-Error "TODO: implement test case"
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
