# gerp 1.0.0

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

# gerp 0.1.0

* Added `ger_proj()`, `ger_code()`, `ger_data()`, `ger_docs()`, and `ger_setup()`   
* Added `data-raw/wu_df.R`, `data-raw/wu_dt.R`, and `data-raw/wu_tbl.R`  
* Added `inst/extdata/wu_data.csv`  
* Added `inst/rmarkdown/templates/gerp-README/README.Rmd` for `README.Rmd` template
* Updated README  
* Added `vignette/getting-started.Rmd`  
* Added a `NEWS.md` file to track changes to the package  
