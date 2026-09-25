# Changelog

## gerp 3.0.0

### Breaking changes

- Removed `ger_proj()`. Use
  [`ger_create()`](https://mjfrigaard.github.io/gerp/reference/ger_create.md)
  instead.
- `ger_create(folder, name)` is now `ger_create(path, open)`.
- [`ger_setup()`](https://mjfrigaard.github.io/gerp/reference/ger_setup.md),
  [`ger_code()`](https://mjfrigaard.github.io/gerp/reference/ger_code.md),
  [`ger_data()`](https://mjfrigaard.github.io/gerp/reference/ger_data.md),
  [`ger_dev()`](https://mjfrigaard.github.io/gerp/reference/ger_dev.md),
  and
  [`ger_report()`](https://mjfrigaard.github.io/gerp/reference/ger_report.md)
  take `path` (was `folder_name`) and never overwrite existing files.
- `ger_code(header)` is now `ger_code(roxygen)`.
- `ger_path(...)` is now `ger_path(path, type, tree)`; `type = "rel"`
  returns the path relative to the working directory.
- [`ger_root()`](https://mjfrigaard.github.io/gerp/reference/ger_root.md)
  defaults to `tree = FALSE` and returns the root path.
- [`ger_batch_rename()`](https://mjfrigaard.github.io/gerp/reference/ger_batch_rename.md)
  defaults to the `"modification"` date and uses the
  [`ger_fname()`](https://mjfrigaard.github.io/gerp/reference/ger_fname.md)
  naming rules.
- [`ger_name()`](https://mjfrigaard.github.io/gerp/reference/ger_name.md)
  replaces every symbol (not just the first) and separates abbreviations
  with underscores.

### New features

- Works in RStudio and Positron.
  [`ger_root()`](https://mjfrigaard.github.io/gerp/reference/ger_root.md)
  finds projects with an `.Rproj` file, `DESCRIPTION`, `.git`, or
  `.here`.
- [`ger_name()`](https://mjfrigaard.github.io/gerp/reference/ger_name.md)
  and
  [`ger_fname()`](https://mjfrigaard.github.io/gerp/reference/ger_fname.md)
  are vectorized, return their result, and gain `clip` (and `date` for
  [`ger_fname()`](https://mjfrigaard.github.io/gerp/reference/ger_fname.md)).
- [`ger_batch_rename()`](https://mjfrigaard.github.io/gerp/reference/ger_batch_rename.md)
  gains `dry_run`, skips already dated files, and returns the old and
  new paths.
- Project templates ship in `inst/templates/` (no downloads required).

### Internal

- Dependencies reduced to cli, clipr, fs, rprojroot, and rstudioapi.
- Added testthat tests and an R CMD check workflow.

## gerp 2.3.1

- Added
  [`ger_root()`](https://mjfrigaard.github.io/gerp/reference/ger_root.md)
  (project root folder),
  [`ger_fpath()`](https://mjfrigaard.github.io/gerp/reference/ger_fpath.md)
  (‘find’ path), and `ger_path_lkp()` (‘look up’ paths).

- Updated documentation with examples from
  [`ger_root()`](https://mjfrigaard.github.io/gerp/reference/ger_root.md),
  `ger_path_lkp()`, and `ger_ftype()`

## gerp 2.3.0

- added `ger_()` function for creating R object names (and vignette)

- added hex sticker for package

## gerp 2.2.0

- added
  [`ger_name()`](https://mjfrigaard.github.io/gerp/reference/ger_name.md)
  function for creating R object names (and vignette)

- added hex sticker for package

## gerp 2.1.0

- New vignettes (getting-started, setup, code, data, documentation, and
  batch-rename)

- Function changes to make them align with R package development:

  - New `ger_proj()`:

    - Uses functions from `usethis` to create R project

  - New
    [`ger_code()`](https://mjfrigaard.github.io/gerp/reference/ger_code.md):

    - Create `R/` folder (instead of `code/`)

  - New
    [`ger_data()`](https://mjfrigaard.github.io/gerp/reference/ger_data.md):

    - Creates `data-raw/`, `data/`, and `inst/extdata/`

  - `ger_docs()` has been replaced with
    [`ger_dev()`](https://mjfrigaard.github.io/gerp/reference/ger_dev.md)
    and
    [`ger_report()`](https://mjfrigaard.github.io/gerp/reference/ger_report.md)

    - [`ger_dev()`](https://mjfrigaard.github.io/gerp/reference/ger_dev.md)
      creates `dev/` folder and adds R Markdown notebook

    - [`ger_report()`](https://mjfrigaard.github.io/gerp/reference/ger_report.md)
      creates `report/` folder and adds R Markdown manuscript file

  - [`ger_setup()`](https://mjfrigaard.github.io/gerp/reference/ger_setup.md)
    adds `changelog.md`, `LICENSE`, `CITATION` and `requirements.md`
    files

## gerp 2.0.0

- Added `ger_proj()`,
  [`ger_code()`](https://mjfrigaard.github.io/gerp/reference/ger_code.md),
  [`ger_data()`](https://mjfrigaard.github.io/gerp/reference/ger_data.md),
  `ger_docs()`, and
  [`ger_setup()`](https://mjfrigaard.github.io/gerp/reference/ger_setup.md)  
- Added `data-raw/wu_df.R`, `data-raw/wu_dt.R`, and
  `data-raw/wu_tbl.R`  
- Added `inst/extdata/wu_data.csv`  
- Added `inst/rmarkdown/templates/gerp-README/README.Rmd` for
  `README.Rmd` template
- Updated README  
- Added `vignette/getting-started.Rmd`  
- Added a `NEWS.md` file to track changes to the package
