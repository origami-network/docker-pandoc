| master | latest |
| :--: | :--: |
| [![Build status](https://ci.appveyor.com/api/projects/status/cwr97n0st0rdxn9v/branch/master?svg=true)](https://ci.appveyor.com/project/BartDubois/docker-pandoc/branch/master) | [![Build status](https://ci.appveyor.com/api/projects/status/cwr97n0st0rdxn9v?svg=true)](https://ci.appveyor.com/project/BartDubois/docker-pandoc) |


Pandoc - Windows Docker image
==

[Pandoc](https://pandoc.org/) can convert between numerous markup and word processing formats.
It is a command-line tool, as such there is no graphic user interface.

Example bellow shows the input markdown and corresponding HTML output.

```markdown
Hello *pandoc*!

- one
- two
```

```html
<p>Hello <em>pandoc</em>!</p>
<ul>
<li>one</li>
<li>two</li>
</ul>
```

It is possible to convert back from HTML to markdown as well.

## Usage

This Docker image allows to use Pandoc without need of installation on Windows 2016 and Windows 10.
It accepts all parameters as specified by [Pandoc command line](https://pandoc.org/MANUAL.html#using-pandoc).


### Pull Docker image

Before start the image need to be pulled from the [Docker Hub](https://hub.docker.com/r/origaminetwork/pandoc/).

```console
> docker pull origaminetwork/pandoc:X.X.X.X.Y
```

Where `X.X.X.X.Y` is the version of the image.


### Generating HTML from markdown

For the file `input.markdown` located in `C:\Users\UserName\Documents\` folder, fallowing command will generate `output.html` document file.

```console
> docker run -v C:\Users\UserName\Documents:C:\Volume origaminetwork/pandoc:X.X.X.X.Y -f markdown -t html C:\Volume\input.markdown -o C:\Volume\output.html
```

See [specification](./Spec/Pandoc.Tests.ps1) for more examples.


FIXME: contributing

FIXME: license
