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
        $volumePath = "C:\Volume"
        $docker = @(
            'run',
            '-v', "$($TestDrive):$($volumePath)"
            $ImageName
        )

        $input = New-TestDriveFile 'input.markdown' @"
Hello *pandoc*!

- one
- two
"@
        $volumeInputPath = (Join-Path $volumePath $input.File)

        It "generates HTML" {
            $resultFileName = 'output.html'
            $pandoc = @(
                '-f', 'markdown'
                '-t', 'html',
                $volumeInputPath,
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

        $metadata = New-TestDriveFile 'metadata.txt' @"
---
title: Metadata Title
author: Metadata Author
...
"@
        $volumeMetadataFile = (Join-Path $volumePath $metadata.File)

        It "generates standalone HTML" {
            $resultFileName = 'output.html'
            $pandoc = @(
                '-f', 'markdown'
                '-t', 'html',
                '-s',
                $volumeMetadataFile, $volumeInputPath,
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
                Should -FileContentMatchExactly '<title>Metadata Title</title>' 
            $resultFile |
                Should -FileContentMatchExactly '<meta name="author" content="Metadata Author" />' 
            $resultFile |
                Should -FileContentMatchExactly '<p>Hello <em>pandoc</em>!</p>' 
            $resultFile |
                Should -FileContentMatchExactly '<li>two</li>'
        }

        It "generates Word" {
            $resultFileName = 'output.docx'
            $pandoc = @(
                '-f', 'markdown'
                '-t', 'docx',
                $volumeMetadataFile, $volumeInputPath,
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
        }

        It "generates ePUB" {
            $resultFileName = 'output.epub'
            $pandoc = @(
                '-f', 'markdown'
                '-t', 'epub',
                $volumeMetadataFile, $volumeInputPath,
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
        }
    }
}
