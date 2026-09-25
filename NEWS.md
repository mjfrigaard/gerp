# gerp 3.0.0

## Breaking changes

* All functions are renamed from the `ger_` prefix to `grp_` (e.g., `ger_create()` is now `grp_create()`).
* `grp_sect()` drops the `<(+_+)>` decoration and gains `level` (`#` is level 1, `##` is level 2, etc.).
* Removed `grp_proj()`. Use `grp_create()` instead.
* `grp_create(folder, name)` is now `grp_create(path, open)`.
* `grp_setup()`, `grp_code()`, `grp_data()`, `grp_dev()`, and `grp_report()` take `path` (was `folder_name`) and never overwrite existing files.
* `grp_code(header)` is now `grp_code(roxygen)`.
* `grp_path(...)` is now `grp_path(path, type, tree)`; `type = "rel"` returns the path relative to the working directory.
* `grp_root()` defaults to `tree = FALSE` and returns the root path.
* `grp_batch_rename()` defaults to the `"modification"` date and uses the `grp_fname()` naming rules.
* `grp_name()` replaces every symbol (not just the first) and separates abbreviations with underscores.

## New features

* Works in RStudio and Positron. `grp_root()` finds projects with an `.Rproj` file, `DESCRIPTION`, `.git`, or `.here`.
* `grp_name()` and `grp_fname()` are vectorized, return their result, and gain `clip` (and `date` for `grp_fname()`).
* `grp_batch_rename()` gains `dry_run`, skips already dated files, and returns the old and new paths.
* Project templates ship in `inst/templates/` (no downloads required).

## Internal

* Dependencies reduced to cli, clipr, fs, rprojroot, and rstudioapi.
* Added testthat tests and an R CMD check workflow.

# gerp 2.3.1

* Added `ger_root()` (project root folder), `ger_fpath()` ('find' path), and `ger_path_lkp()` ('look up' paths).

* Updated documentation with examples from `ger_root()`, `ger_path_lkp()`, and `ger_ftype()`

# gerp 2.3.0

* added `ger_()` function for creating R object names (and vignette)  

* added hex sticker for package

# gerp 2.2.0

* added `ger_name()` function for creating R object names (and vignette)  

* added hex sticker for package

# gerp 2.1.0

* New vignettes (getting-started, setup, code, data, documentation, and batch-rename) 

* Function changes to make them align with R package development:

  * New `ger_proj()`:

    - Uses functions from `usethis` to create R project

  * New `ger_code()`:
  
      - Create `R/` folder (instead of `code/`)
      
  * New `ger_data()`: 
  
      - Creates `data-raw/`, `data/`, and `inst/extdata/`
      
  * `ger_docs()` has been replaced with `ger_dev()` and `ger_report()`
    
      - `ger_dev()` creates `dev/` folder and adds R Markdown notebook  
      
      - `ger_report()` creates `report/` folder and adds R Markdown manuscript file
      
  * `ger_setup()` adds `changelog.md`, `LICENSE`, `CITATION` and `requirements.md` files

# gerp 2.0.0

* Added `ger_proj()`, `ger_code()`, `ger_data()`, `ger_docs()`, and `ger_setup()`   
* Added `data-raw/wu_df.R`, `data-raw/wu_dt.R`, and `data-raw/wu_tbl.R`  
* Added `inst/extdata/wu_data.csv`  
* Added `inst/rmarkdown/templates/gerp-README/README.Rmd` for `README.Rmd` template
* Updated README  
* Added `vignette/getting-started.Rmd`  
* Added a `NEWS.md` file to track changes to the package  
