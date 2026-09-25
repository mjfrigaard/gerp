test_that("ger_path() returns absolute and relative paths", {
  tmp <- withr::local_tempdir()
  withr::local_dir(tmp)
  dir.create("sub")
  expect_equal(as.character(ger_path("sub")), as.character(fs::path_abs("sub")))
  expect_equal(as.character(ger_path("sub", type = "rel")), "sub")
})

test_that("ger_root() and ger_lkp_path() find project files", {
  withr::local_options(cli.default_handler = function(...) NULL)
  tmp <- withr::local_tempdir()
  ger_create(file.path(tmp, "proj"), open = FALSE)
  sub <- file.path(tmp, "proj", "R")
  expect_equal(basename(ger_root(sub)), "proj")
  expect_output(found <- ger_lkp_path("notebook.Rmd", path = file.path(tmp, "proj")), "notebook.Rmd")
  expect_equal(basename(found), "notebook.Rmd")
})

test_that("editor helpers print when no IDE is running", {
  expect_output(ger_sect("import"), "<\\(\\+_\\+\\)> import")
  expect_output(ger_headr(), "This is code to create")
})
