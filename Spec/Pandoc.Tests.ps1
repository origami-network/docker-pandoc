[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingCmdletAliases", "")]

param (
    [Parameter(Mandatory = $true)]
    $ImageName,

    $Here = (Split-Path -Parent $MyInvocation.MyCommand.Path),
    $ModulesPath = (Join-Path $Here "Modules")
)


Write-Warning "TODO: define specification"

Describe "Pandoc image" {
    It "need to be deifned" {
        $true |
            Should -Be $false
    }
}
