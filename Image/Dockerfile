FROM microsoft/windowsservercore as pandoc

ARG ARG_PANDOC_VERSION
ARG ARG_PANDOC_URL="https://github.com/jgm/pandoc/releases/download/${ARG_PANDOC_VERSION}/pandoc-${ARG_PANDOC_VERSION}-windows-x86_64.zip"
ARG ARG_PANDOC_PATH=C:\\Pandoc

COPY Install C:\\Install\\

RUN powershell.exe -Command $ErrorActionPreference = 'Stop' ; \
  C:\\Install\\Install-ZipPackage.ps1 $env:ARG_PANDOC_URL -DestinationPath $env:ARG_PANDOC_PATH -Verbose


FROM microsoft/windowsservercore:ltsc2016

ARG ARG_PANDOC_PATH=C:\\Pandoc

COPY --from=pandoc ${ARG_PANDOC_PATH} ${ARG_PANDOC_PATH}

WORKDIR ${ARG_PANDOC_PATH}

# TODO: Define entrypoint
