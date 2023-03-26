#' good enough R development folder
#'
#' @importFrom fs dir_create
#' @importFrom fs file_create
#' @importFrom fs file_show
#' @importFrom readr write_lines
#'
#'
#' @export ger_dev
#'
#' @description
#' Create `dev/` folder with `dev/notebook.Rmd` and `changelog.md` files.
#'
#'
#' \describe{
#'   \item{dev/notebook.Rmd}{An R Markdown notebook (i.e., lab notebook).}
#' }
#'
ger_dev <- function(folder_name = NULL) {
  notebook_content <- c("---\n#...a running lab notebook describing various ideas for the project\n# and how these were implemented\ntitle: \"Notebook\"\noutput: \"html_notebook\"\n---\n\n\nThis is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code.\n\n\nTry executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Cmd+Shift+Enter*.\n\n```{r}\n\nplot(cars)\n\n```\n\n\nAdd a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Cmd+Option+I*.\n\n\nWhen you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Cmd+Shift+K* to preview the HTML file).\n\n\nThe preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.\n\n\n\n\nsource: https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/")

  if (!is.null(folder_name)) {
    fs::dir_create(paste0(folder_name, "/", "dev"))
    # notebook --------
    fs::file_create(paste0(folder_name, "/", "dev/notebook.Rmd"))
    readr::write_lines(
      x = notebook_content,
      file = paste0(folder_name, "/", "dev/notebook.Rmd")
    )
  } else {
    fs::dir_create("dev")
    # notebook --------
    fs::file_create("dev/notebook.Rmd")
    readr::write_lines(x = notebook_content, file = "dev/notebook.Rmd")
  }
}
