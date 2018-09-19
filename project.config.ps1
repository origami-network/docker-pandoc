$script:PandocVersion = "2.3"
$script:PandocVersionSufix = ".0.0"
$script:Revision = 0

@{
    Version = "$($script:PandocVersion)$($script:PandocVersionSufix).$($script:Revision)"

    Image = @{
        Name = "origaminetwork/pandoc"

        Context = @{
            Path = "Image"
        }
        Arguments = @{
            Pandoc = @{
                Version = $script:PandocVersion
            }
        }
        Specification = @{
            Path = "Spec"
        }
    }

    Dependencies = @(
        @{ Name = 'Pester'; RequiredVersion = '4.3.1' }
    )

    Artifacts = @{
        Path = ".Artifacts"
    }
}
