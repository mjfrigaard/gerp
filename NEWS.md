# gerp 2.3.1

* Added `ger_root()` (project root folder), `ger_fpath()` ('find' path), and `ger_path_lkp()` ('look up' paths).

* Updated documwntation with examples from `ger_root()`, `ger_path_lkp()`, and `ger_ftype()`

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
