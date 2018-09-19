FROM microsoft/windowsservercore as pandoc

ARG ARG_PANDOC_VERSION
ARG ARG_PANDOC_URL="https://github.com/jgm/pandoc/releases/download/${ARG_PANDOC_VERSION}/pandoc-${ARG_PANDOC_VERSION}-windows-x86_64.zip"
ARG ARG_PANDOC_PATH=C:\\Pandoc

# TODO: donwload Pandoc


FROM microsoft/windowsservercore:ltsc2016

ARG ARG_PANDOC_PATH=C:\\Pandoc

# TODO: install Pandoc

WORKDIR ${ARG_PANDOC_PATH}

# TODO: Define entrypoint
