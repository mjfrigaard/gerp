#' good enough R report folder
#'
#' @importFrom fs dir_create
#' @importFrom fs file_create
#' @importFrom fs file_show
#' @importFrom readr write_lines
#'
#' @export ger_report
#'
#' @description
#' Create report folder with `report/manuscript.Rmd`
#'
#'
#' \describe{
#'   \item{report/manuscript.Rmd}{A more polished R Markdown file for reports or manuscripts.}
#' }
ger_report <- function(folder_name = NULL) {
  manuscript_content <-
    c("---\n## ....a running draft of a manuscript describing the project findings\ntitle: \"Manuscript\"\noutput: \"html_document\"\n---\n\n\n```{r setup, include=FALSE}\nknitr::opts_chunk$set(echo = TRUE)\n```\n\n## R Markdown\n\nThis is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.\n\nWhen you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:\n\n```{r cars}\nsummary(cars)\n```\n\n## Including Plots\n\nYou can also embed plots, for example:\n\n```{r pressure, echo=FALSE}\nplot(pressure)\n```\n\nNote that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot\n\nSource: https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/")
  if (!is.null(folder_name)) {
    fs::dir_create(paste0(folder_name, "/", "report"))
    # manuscript --------
    fs::file_create(paste0(folder_name, "/", "report/manuscript.Rmd"))
    readr::write_lines(
      x = manuscript_content,
      file = paste0(folder_name, "/", "report/manuscript.Rmd")
    )
  } else {
    fs::dir_create("report")
    # manuscript --------
    fs::file_create("report/manuscript.Rmd")
    readr::write_lines(x = manuscript_content, file = "report/manuscript.Rmd")
  }

}
