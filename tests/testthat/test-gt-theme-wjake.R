test_that("gt_theme_wjake() returns a gt_tbl", {
  tbl <- gt::gt(data.frame(x = 1.0)) |> gt_theme_wjake()
  expect_s3_class(tbl, "gt_tbl")
})

test_that("gt_theme_wjake() adds the source note", {
  tbl <- gt::gt(data.frame(x = 1.0)) |> gt_theme_wjake()
  expect_equal(tbl[["_source_notes"]][[1]], "Table: @wjakethompson.com")
})

test_that("gt_theme_wjake() inherits gt_theme_apa() number formatting", {
  df <- data.frame(
    int_col = c(1L, 2L),
    dbl_col = c(1.5, 20.0),
    corr_col = c(0.123, 0.456)
  )
  tbl <- gt::gt(df) |> gt_theme_wjake()
  expect_snapshot(gt::extract_body(tbl))
})
