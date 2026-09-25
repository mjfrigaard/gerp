# Create a new good enough R project

Create a new 'good enough' project folder with all the gerp files and
folders
([`grp_setup()`](https://mjfrigaard.github.io/gerp/reference/grp_setup.md),
[`grp_code()`](https://mjfrigaard.github.io/gerp/reference/grp_code.md),
[`grp_data()`](https://mjfrigaard.github.io/gerp/reference/grp_data.md),
[`grp_dev()`](https://mjfrigaard.github.io/gerp/reference/grp_dev.md),
[`grp_report()`](https://mjfrigaard.github.io/gerp/reference/grp_report.md)),
a `README.Rmd`, and an `.Rproj` file. The project is opened in RStudio
or Positron when `open = TRUE`.

## Usage

``` r
grp_create(path, open = interactive())
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
grp_create(tmp, open = FALSE)
#> ✔ Creating /tmp/RtmpDzzcY9/my-project
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/changelog.md
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/CITATION
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/requirements.md
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/LICENSE
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/R/import.R
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/R/tidy.R
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/R/wrangle.R
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/R/visualize.R
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/R/model.R
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/R/data.R
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/data.md
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/dev/notebook.Rmd
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/report/manuscript.Rmd
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/README.Rmd
#> ✔ Writing /tmp/RtmpDzzcY9/my-project/my-project.Rproj
```
