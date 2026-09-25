# Batch-rename files

``` r

library(gerp)
```

This vignette covers
[`ger_batch_rename()`](https://mjfrigaard.github.io/gerp/reference/ger_batch_rename.md),
a function that gives you the ability to rename a folder of files in a
[standardized format.](https://www.slideshare.net/milkers/naming-things)

## Test files

Below we’ll create a folder of messy file names in a temporary folder.

``` r

tmp_files <- file.path(tempdir(), "filenames")
dir.create(tmp_files)
messy <- c(
  "JW7d^(2sl@deletethisandyourcareerisoverWx2.txt",
  "Joe's Filenames Use Space and Punctuation.xlsx",
  "fig 2.png",
  "figure 1.png",
  "myabstract.docx"
)
file.create(file.path(tmp_files, messy))
#> [1] TRUE TRUE TRUE TRUE TRUE
```

Confirm this with
[`gerp::ger_path()`](https://mjfrigaard.github.io/gerp/reference/ger_path.md)

``` r

gerp::ger_path(tmp_files, tree = TRUE)
#> /tmp/Rtmp3BCLW0/filenames
#> ├── JW7d^(2sl@deletethisandyourcareerisoverWx2.txt
#> ├── Joe's Filenames Use Space and Punctuation.xlsx
#> ├── fig 2.png
#> ├── figure 1.png
#> └── myabstract.docx
```

## `ger_batch_rename()`

The files in the temporary `filenames/` folder are a mess, and I want to
rename them using a [standardized
format](https://www.slideshare.net/milkers/naming-things). Renaming
files manually can be time-consuming, so
[`ger_batch_rename()`](https://mjfrigaard.github.io/gerp/reference/ger_batch_rename.md)
will get you 90% there:

- all file names are converted to lowercase words separated by hyphens
  (the same rules as
  [`ger_fname()`](https://mjfrigaard.github.io/gerp/reference/ger_fname.md))

- all punctuation and special characters are removed from file names

- file names have a date prefix (the `"modification"` date, but other
  options include `"birth"`, `"access"`, or `"change"`)

- files that already have a date prefix are skipped

Preview the new names with `dry_run = TRUE`:

``` r

preview <- gerp::ger_batch_rename(tmp_files, dry_run = TRUE)
basename(preview$new)
#> [1] "2026-09-25_jw7d-2sl-deletethisandyourcareerisoverwx2.txt"
#> [2] "2026-09-25_joes-filenames-use-space-and-punctuation.xlsx"
#> [3] "2026-09-25_fig-2.png"                                    
#> [4] "2026-09-25_figure-1.png"                                 
#> [5] "2026-09-25_myabstract.docx"
```

Then rename the files:

``` r

gerp::ger_batch_rename(tmp_files)
#> ✔ Renamed 5 files in /tmp/Rtmp3BCLW0/filenames
```

And confirm with
[`gerp::ger_path()`](https://mjfrigaard.github.io/gerp/reference/ger_path.md)

``` r

gerp::ger_path(tmp_files, tree = TRUE)
#> /tmp/Rtmp3BCLW0/filenames
#> ├── 2026-09-25_fig-2.png
#> ├── 2026-09-25_figure-1.png
#> ├── 2026-09-25_joes-filenames-use-space-and-punctuation.xlsx
#> ├── 2026-09-25_jw7d-2sl-deletethisandyourcareerisoverwx2.txt
#> └── 2026-09-25_myabstract.docx
```

**NOTE:**
[`ger_batch_rename()`](https://mjfrigaard.github.io/gerp/reference/ger_batch_rename.md)
can’t change the ***content*** of the files (and you wouldn’t want it
to).
