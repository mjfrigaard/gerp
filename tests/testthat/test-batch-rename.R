test_that("ger_batch_rename() renames files once", {
  withr::local_options(cli.default_handler = function(...) NULL)
  tmp <- withr::local_tempdir()
  file.create(file.path(tmp, c("My File.txt", "Joe's DATA.csv")))

  preview <- ger_batch_rename(tmp, dry_run = TRUE)
  expect_equal(nrow(preview), 2)
  expect_setequal(list.files(tmp), c("My File.txt", "Joe's DATA.csv"))

  ger_batch_rename(tmp)
  today <- as.character(Sys.Date())
  expect_setequal(list.files(tmp), paste0(today, c("_my-file.txt", "_joes-data.csv")))

  again <- ger_batch_rename(tmp)
  expect_equal(nrow(again), 0)
})

test_that("ger_batch_rename() validates inputs", {
  expect_error(ger_batch_rename(tempfile()), "not a folder")
  expect_error(ger_batch_rename(tempdir(), prefix = "bad"))
})
