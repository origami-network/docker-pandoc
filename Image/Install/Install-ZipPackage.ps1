[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string] $Uri,

    [Parameter(Mandatory = $true)]
    [string] $DestinationPath,

    [string] $PackageDirectory = '*'
)

$packageName = [guid]::NewGuid()

Write-Verbose "Zip Package: Setup security protocols"
[Net.ServicePointManager]::SecurityProtocol = 'Tls', 'Tls11', 'Tls12'

Write-Verbose "Zip Package: Download '$($Uri)'"
$packageFile = Join-Path $env:TEMP "$($packageName).zip"
Invoke-WebRequest $Uri -OutFile $packageFile

Write-Verbose "Zip Package: Expand"
$packagePath = Join-Path $env:TEMP $packageName
Expand-Archive -Path $packageFile -DestinationPath $packagePath

Write-Verbose "Zip Package: Copy"
$subPath = Get-Item (Join-Path $packagePath $PackageDirectory)
Move-Item $subPath -Destination $DestinationPath -Force
