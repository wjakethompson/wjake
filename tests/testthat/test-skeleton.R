test_that("copying consulting_report pdf files works", {
  testthat::skip_on_cran()

  # work in a temp directory
  dir <- create_local_rmd_dir(dir = fs::file_temp(pattern = "conrep"))

  consulting_report_skeleton(dir)
  check_files <- list.files(dir, recursive = TRUE)

  expect_equal(sort(check_files),
               sort(c("bib/refs.bib", "csl/apa.csl", "_bookdown.yml",
                      paste0(tolower(basename(dir)), ".Rmd"),
                      "figures/pre-generated/wjakethompson.png",
                      "figures/pre-generated/wjt-letterhead.pdf",
                      "figures/pre-generated/wjt-letterhead.png")))
})