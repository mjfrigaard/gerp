#' good enuff R documentation
#'
#' @importFrom fs dir_create
#' @importFrom fs file_create
#' @importFrom fs file_show
#' @importFrom readr write_lines
#'
#' @param show_file open changelog.md file?
#'
#' @export ger_docs
#'
#' @description Create docs folder with docs/notebook.Rmd, docs/manuscript.Rmd,
#'     and changelog.md files.
#' \describe{
#'   \item{docs/notebook.Rmd}{An R Markdown notebook (i.e., lab notebook).}
#'   \item{docs/manuscript.Rmd}{A more polished R Markdown file for reports or manuscripts.}
#'   \item{changelog.md}{Manually document changes to the files or folders in your project.}
#' }
#'
ger_docs <- function(show_file = TRUE) {
  fs::dir_create("docs")
# notebook ----------------------------------------------------------------
  fs::file_create("docs/notebook.Rmd")
  notebook_content <- "---\n#...a running lab notebook describing various ideas for the project\n# and how these were implemented\ntitle: \"Notebook\"\noutput: \"html_notebook\"\n---\n\n\nThis is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code.\n\n\nTry executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Cmd+Shift+Enter*.\n\n```{r}\n\nplot(cars)\n\n```\n\n\nAdd a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Cmd+Option+I*.\n\n\nWhen you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Cmd+Shift+K* to preview the HTML file).\n\n\nThe preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.\n\n\n\n\nsource: https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/"
  readr::write_lines(x = notebook_content, file = "docs/notebook.Rmd")
# manuscript --------------------------------------------------------------
  fs::file_create("docs/manuscript.Rmd")
  manuscript_content <- "---\n## ....a running draft of a manuscript describing the project findings\ntitle: \"Manuscript\"\noutput: \"html_document\"\n---\n\n\n```{r setup, include=FALSE}\nknitr::opts_chunk$set(echo = TRUE)\n```\n\n## R Markdown\n\nThis is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.\n\nWhen you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:\n\n```{r cars}\nsummary(cars)\n```\n\n## Including Plots\n\nYou can also embed plots, for example:\n\n```{r pressure, echo=FALSE}\nplot(pressure)\n```\n\nNote that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot\n\nSource: https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/"
  readr::write_lines(x = manuscript_content, file = "docs/manuscript.Rmd")

# changelog ---------------------------------------------------------------
  fs::file_create("changelog.md")
  tday <- as.character(Sys.Date())
  date_stamp <- paste0("## ", tday)
  changelog_content <- c("<!--\n...make dated notes about changes to the project in this file in reverse\nchronological order (i.e., most recent first). See examples below:\n-->", "\n# CHANGELOG", "=============\n", date_stamp , "\n* Created docs/ folder", "\n* Created docs/notebook.Rmd and docs/manuscript.Rmd", "\nSource: https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/")
  readr::write_lines(x = changelog_content, file = "changelog.md")
  if (show_file == TRUE) {
   fs::file_show(path = "changelog.md")
  }

}
