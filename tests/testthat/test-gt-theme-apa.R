test_that("gt_theme_apa() returns a gt_tbl", {
  tbl <- gt::gt(data.frame(x = 1.0)) |> gt_theme_apa()
  expect_s3_class(tbl, "gt_tbl")
})

test_that("gt_theme_apa() formats integers with 0 decimals", {
  tbl <- gt::gt(data.frame(x = c(1L, 10L, 100L))) |> gt_theme_apa()
  expect_snapshot(gt::extract_body(tbl))
})

test_that("gt_theme_apa() formats doubles with dec_dig decimals", {
  tbl1 <- gt::gt(data.frame(x = c(1.234, 56.789))) |> gt_theme_apa(dec_dig = 1)
  tbl2 <- gt::gt(data.frame(x = c(1.234, 56.789))) |> gt_theme_apa(dec_dig = 2)
  expect_snapshot(gt::extract_body(tbl1))
  expect_snapshot(gt::extract_body(tbl2))
})

test_that("gt_theme_apa() has correlations with 3 digits and no leading zero", {
  tbl <- gt::gt(data.frame(r = c(-0.5, 0.0, 0.123, 0.456))) |> gt_theme_apa()
  expect_snapshot(gt::extract_body(tbl))
})

test_that("gt_theme_apa() substitutes extreme doubles based on dec_dig", {
  df <- data.frame(x = c(0.05, 0.1, 99.9, 99.95))
  tbl1 <- gt::gt(df) |> gt_theme_apa(dec_dig = 1)
  tbl2 <- gt::gt(df) |> gt_theme_apa(dec_dig = 2)
  expect_snapshot(gt::extract_body(tbl1))
  expect_snapshot(gt::extract_body(tbl2))
})

test_that("gt_theme_apa() substitutes extreme correlations based on corr_dig", {
  df <- data.frame(r = c(-0.9999, -0.999, 0.999, 0.9999))
  tbl1 <- gt::gt(df) |> gt_theme_apa(corr_dig = 3)
  tbl2 <- gt::gt(df) |> gt_theme_apa(corr_dig = 2)
  expect_snapshot(gt::extract_body(tbl1))
  expect_snapshot(gt::extract_body(tbl2))
})

test_that("gt_theme_apa() can skip extreme substitution", {
  df <- data.frame(x = c(0.05, 99.95), r = c(-0.9999, 0.9999))
  tbl <- gt::gt(df) |> gt_theme_apa(dec_dig = 1, fmt_extreme = FALSE)
  expect_snapshot(gt::extract_body(tbl))
})

test_that("gt_theme_apa() returns a gt_tbl for grouped input", {
  df <- data.frame(group = c("A", "A", "B"), x = c(1.1, 2.2, 3.3))
  tbl <- gt::gt(df, groupname_col = "group") |> gt_theme_apa()
  expect_s3_class(tbl, "gt_tbl")
  expect_equal(tbl[["_row_groups"]], c("A", "B"))
})

test_that("gt_theme_apa() applies number formatting in grouped tables", {
  df <- data.frame(
    group = c("A", "A", "B"),
    int_col = c(1L, 2L, 3L),
    dbl_col = c(1.5, 20.0, 99.95),
    corr_col = c(0.123, 0.456, 0.789)
  )
  tbl <- gt::gt(df, groupname_col = "group") |> gt_theme_apa(dec_dig = 1)
  expect_snapshot(gt::extract_body(tbl))
})
