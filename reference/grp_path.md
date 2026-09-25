# Get file path(s)

Use `grp_path()` to view folder and file paths. Absolute paths are the
exact location of a file or folder in the file system (they start with
the root folder). Relative paths start from the current working
directory.

## Usage

``` r
grp_path(path = ".", type = c("abs", "rel"), tree = FALSE)
```

## Arguments

- path:

  file or folder path

- type:

  absolute (`"abs"`) or relative (`"rel"`) path

- tree:

  logical, print a folder tree?

## Value

path(s) (invisibly if `tree = TRUE`)

## Examples

``` r
grp_path(".")
#> /home/runner/work/gerp/gerp/docs/reference
grp_path(tempdir(), type = "rel")
#> ../../../../../../../tmp/RtmpDzzcY9
```
