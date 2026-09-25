test_that("ger_create() builds a complete project", {
  withr::local_options(cli.default_handler = function(...) NULL)
  tmp <- withr::local_tempdir()
  pth <- file.path(tmp, "proj")
  ger_create(pth, open = FALSE)
  files <- c(
    "CITATION", "LICENSE", "README.Rmd", "changelog.md", "data.md",
    "requirements.md", "proj.Rproj", "dev/notebook.Rmd",
    "report/manuscript.Rmd", "R/import.R", "R/data.R"
  )
  expect_true(all(file.exists(file.path(pth, files))))
  expect_true(all(dir.exists(file.path(pth, c("data", "data-raw", "inst/extdata")))))
  expect_match(readLines(file.path(pth, "changelog.md")), as.character(Sys.Date()), all = FALSE)
})

test_that("ger_create() refuses existing folders", {
  tmp <- withr::local_tempdir()
  expect_error(ger_create(tmp, open = FALSE), "already exists")
})

test_that("scaffold functions do not overwrite files", {
  withr::local_options(cli.default_handler = function(...) NULL)
  tmp <- withr::local_tempdir()
  writeLines("keep", file.path(tmp, "CITATION"))
  ger_setup(tmp)
  expect_equal(readLines(file.path(tmp, "CITATION")), "keep")
})

test_that("ger_code() writes script headers", {
  withr::local_options(cli.default_handler = function(...) NULL)
  tmp <- withr::local_tempdir()
  ger_code(tmp, roxygen = FALSE)
  expect_match(readLines(file.path(tmp, "R/model.R"))[2], "This is code to create")
})
