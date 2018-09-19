FROM microsoft/windowsservercore as pandoc

ARG ARG_PANDOC_VERSION
ARG ARG_PANDOC_URL="https://github.com/jgm/pandoc/releases/download/${ARG_PANDOC_VERSION}/pandoc-${ARG_PANDOC_VERSION}-windows-x86_64.zip"
ARG ARG_PANDOC_PATH=C:\\Pandoc

RUN powershell.exe -Command $ErrorActionPreference = 'Stop' ; \
  $filePath = Join-Path $env:TEMP pandoc.zip ; \
  [Net.ServicePointManager]::SecurityProtocol = 'Tls', 'Tls11', 'Tls12' ; \
  Invoke-WebRequest $env:ARG_PANDOC_URL -OutFile $filePath ; \
  Expand-Archive -Path $filePath -DestinationPath $env:ARG_PANDOC_PATH ; \
  $subPath = Join-Path $env:ARG_PANDOC_PATH 'pandoc-*' ; \
  Rename-Item $subPath 'package'


FROM microsoft/windowsservercore:ltsc2016

ARG ARG_PANDOC_PATH=C:\\Pandoc

# TODO: install Pandoc

WORKDIR ${ARG_PANDOC_PATH}

# TODO: Define entrypoint
