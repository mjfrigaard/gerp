# Rename all files in a folder

Rename every file in `path` with a date prefix (`YYYY-MM-DD_`) and a
clean, lowercase, hyphenated name (see
[`grp_fname()`](https://mjfrigaard.github.io/gerp/reference/grp_fname.md)).
Files that already start with a date prefix are skipped.

## Usage

``` r
grp_batch_rename(
  path,
  prefix = c("modification", "birth", "access", "change"),
  dry_run = FALSE
)
```

## Arguments

- path:

  path to folder

- prefix:

  which file date to use for the prefix (`"modification"`, `"birth"`,
  `"access"`, or `"change"`). `"birth"` falls back to `"modification"`
  on systems that don't record it.

- dry_run:

  logical, preview the new names without renaming?

## Value

a data.frame with the `old` and `new` file paths (invisibly unless
`dry_run = TRUE`)

## Examples

``` r
tmp <- file.path(tempdir(), "rename-example")
dir.create(tmp)
file.create(file.path(tmp, c("My File.txt", "Joe's DATA (final).csv")))
#> [1] TRUE TRUE
grp_batch_rename(tmp, dry_run = TRUE)
#>                                                     old
#> 1 /tmp/RtmpDzzcY9/rename-example/Joe's DATA (final).csv
#> 2            /tmp/RtmpDzzcY9/rename-example/My File.txt
#>                                                             new
#> 1 /tmp/RtmpDzzcY9/rename-example/2026-09-25_joes-data-final.csv
#> 2         /tmp/RtmpDzzcY9/rename-example/2026-09-25_my-file.txt
```
