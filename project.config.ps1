$script:PandocVersion = "2.2.3.2"
$script:Revision = 0

@{
    Version = "$($script:PandocVersion).$($script:Revision)"

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
