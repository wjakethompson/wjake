test_that("xy scales render correctly", {
  example_data <- tibble::tibble(
    pct = seq(0, 1, length.out = 50),
    n = seq(0, 5000, length.out = 50)
  )

  p <- ggplot(example_data, aes(x = n, y = n)) +
    geom_point() +
    scale_x_comma() +
    scale_y_comma()
  vdiffr::expect_doppelganger("comma-comma", p)

  p <- ggplot(example_data, aes(x = n, y = pct)) +
    geom_point() +
    scale_x_comma() +
    scale_y_percent()
  vdiffr::expect_doppelganger("comma-percent", p)

  p <- ggplot(example_data, aes(x = pct, y = n)) +
    geom_point() +
    scale_x_percent() +
    scale_y_comma()
  vdiffr::expect_doppelganger("percent-comma", p)

  p <- ggplot(example_data, aes(x = pct, y = pct)) +
    geom_point() +
    scale_x_comma() +
    scale_y_comma()
  vdiffr::expect_doppelganger("percent-percent", p)
})
