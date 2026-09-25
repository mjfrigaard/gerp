test_that("grp_path() returns absolute and relative paths", {
  tmp <- withr::local_tempdir()
  withr::local_dir(tmp)
  dir.create("sub")
  expect_equal(as.character(grp_path("sub")), as.character(fs::path_abs("sub")))
  expect_equal(as.character(grp_path("sub", type = "rel")), "sub")
})

test_that("grp_root() and grp_lkp_path() find project files", {
  withr::local_options(cli.default_handler = function(...) NULL)
  tmp <- withr::local_tempdir()
  grp_create(file.path(tmp, "proj"), open = FALSE)
  sub <- file.path(tmp, "proj", "R")
  expect_equal(basename(grp_root(sub)), "proj")
  expect_output(found <- grp_lkp_path("notebook.Rmd", path = file.path(tmp, "proj")), "notebook.Rmd")
  expect_equal(basename(found), "notebook.Rmd")
})

test_that("editor helpers print when no IDE is running", {
  expect_output(grp_sect("import"), "^# import -+$")
  expect_output(grp_sect("import", level = 2), "^## import -+$")
  expect_output(x <- grp_sect("import", level = 3))
  expect_equal(nchar(x), 81)
  expect_error(grp_sect("import", level = 0), "level")
  expect_output(grp_headr(), "This is code to create")
})
