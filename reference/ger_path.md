# Get file path(s)

Use `ger_path()` to view folder and file paths. Absolute paths are the
exact location of a file or folder in the file system (they start with
the root folder). Relative paths start from the current working
directory.

## Usage

``` r
ger_path(path = ".", type = c("abs", "rel"), tree = FALSE)
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
ger_path(".")
#> /home/runner/work/gerp/gerp/docs/reference
ger_path(tempdir(), type = "rel")
#> ../../../../../../../tmp/Rtmpd22aGr
```
