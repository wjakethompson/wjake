test_that("unknown template errors", {
  expect_error(find_resource("consulting_report", "template2.tex"),
               "Couldn't find template")
  expect_error(find_resource("consulting_report", "template.docx"),
               "Couldn't find template")
  expect_error(find_resource("something_else", "template.tex"),
               "Couldn't find template")
})

test_that("consulting_report renders", {
  testthat::skip_on_cran()

  # work in a temp directory
  dir <- create_local_rmd_dir(dir = fs::file_temp(pattern = "conrep"))

  consulting_report_skeleton(dir)
  rmd_name <- tolower(basename(dir))
  suppressWarnings(knit_with_contract("estimate.Rmd", quiet = TRUE,
                                      clean_envir = FALSE))
  expect_true(file.exists(paste0("_report/consulting-scope.pdf")))
  expect_true(file.exists(paste0("_report/consulting-agreement.pdf")))
  expect_true(file.exists("_report/full-contract.pdf"))
})
