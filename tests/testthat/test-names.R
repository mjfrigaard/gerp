test_that("ger_name() creates snake_case object names", {
  expect_equal(ger_name("MY DATA", clip = FALSE), "my_data")
  expect_equal(ger_name("__my data__", clip = FALSE), "my_data")
  expect_equal(ger_name("patient.data", clip = FALSE), "patient_data")
  expect_equal(ger_name("---patient/data.csv", clip = FALSE), "patient_data_csv")
})

test_that("ger_name() moves numeric prefixes to the end", {
  expect_equal(ger_name("2022 DATA", clip = FALSE), "data_2022")
  expect_equal(ger_name("2022-10-12-Alpha-20%", clip = FALSE), "alpha_20_perc_2022_10_12")
  expect_equal(ger_name("2022", clip = FALSE), "num_var")
})

test_that("ger_name() abbreviates symbols once per run", {
  expect_equal(
    ger_name("~ ! @ # $ % ^ & * — = +", clip = FALSE),
    "tilde_bang_at_num_dollar_perc_hat_and_ast_emdash_equals_plus"
  )
  expect_equal(ger_name("20 % of this & that", clip = FALSE), "perc_of_this_and_that_20")
  expect_equal(ger_name("... !! ++", clip = FALSE), "bang_plus")
})

test_that("ger_name() is vectorized and abbreviates", {
  expect_equal(ger_name(c("A b", "C d"), clip = FALSE), c("a_b", "c_d"))
  expect_equal(ger_name("first_day_of_the_month", abbr = TRUE, clip = FALSE), "first_dy_f_th_mnth")
})

test_that("ger_fname() creates dated kebab-case file names", {
  d <- as.Date("2023-04-10")
  expect_equal(ger_fname("My File.txt", date = d, clip = FALSE), "2023-04-10_my-file.txt")
  expect_equal(
    ger_fname("%Joe's%crazy*!$#FILE%name.xlsx", date = d, clip = FALSE),
    "2023-04-10_joes-crazy-file-name.xlsx"
  )
  expect_equal(ger_fname("01-report.xlsx", date = d, clip = FALSE), "2023-04-10_01-report.xlsx")
  expect_equal(ger_fname("new_data", date = NULL, clip = FALSE), "new-data")
})
