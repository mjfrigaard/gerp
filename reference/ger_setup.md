# Good enough R setup files

Create start-up files for a project (`changelog.md`, `CITATION`,
`requirements.md`, and `LICENSE`). Existing files are not overwritten.

- changelog.md:

  Manually document changes to the files or folders in your project.

- CITATION:

  Information and example of how to cite your project.

- requirements.md:

  Advice on how to manually list the requirements for your project.

- LICENSE:

  The [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/)
  license.

## Usage

``` r
ger_setup(path = ".")
```

## Arguments

- path:

  path to project folder

## Value

`path` (invisibly)

## Examples

``` r
tmp <- file.path(tempdir(), "setup-example")
ger_setup(tmp)
#> ✔ Writing /tmp/Rtmpd22aGr/setup-example/changelog.md
#> ✔ Writing /tmp/Rtmpd22aGr/setup-example/CITATION
#> ✔ Writing /tmp/Rtmpd22aGr/setup-example/requirements.md
#> ✔ Writing /tmp/Rtmpd22aGr/setup-example/LICENSE
```
