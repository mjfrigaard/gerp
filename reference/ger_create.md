# Create a new good enough R project

Create a new 'good enough' project folder with all the gerp files and
folders
([`ger_setup()`](https://mjfrigaard.github.io/gerp/reference/ger_setup.md),
[`ger_code()`](https://mjfrigaard.github.io/gerp/reference/ger_code.md),
[`ger_data()`](https://mjfrigaard.github.io/gerp/reference/ger_data.md),
[`ger_dev()`](https://mjfrigaard.github.io/gerp/reference/ger_dev.md),
[`ger_report()`](https://mjfrigaard.github.io/gerp/reference/ger_report.md)),
a `README.Rmd`, and an `.Rproj` file. The project is opened in RStudio
or Positron when `open = TRUE`.

## Usage

``` r
ger_create(path, open = interactive())
```

## Arguments

- path:

  path to the new project folder (must not exist)

- open:

  logical, open the new project?

## Value

`path` (invisibly)

## Examples

``` r
tmp <- file.path(tempdir(), "my-project")
ger_create(tmp, open = FALSE)
#> ✔ Creating /tmp/Rtmpd22aGr/my-project
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/changelog.md
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/CITATION
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/requirements.md
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/LICENSE
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/R/import.R
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/R/tidy.R
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/R/wrangle.R
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/R/visualize.R
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/R/model.R
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/R/data.R
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/data.md
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/dev/notebook.Rmd
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/report/manuscript.Rmd
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/README.Rmd
#> ✔ Writing /tmp/Rtmpd22aGr/my-project/my-project.Rproj
```
