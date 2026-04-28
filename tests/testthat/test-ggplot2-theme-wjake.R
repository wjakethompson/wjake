test_that("theme_wjake() fonts and axes", {
  p <- ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
    geom_point(na.rm = TRUE) +
    labs(
      x = "**Bill length** (mm)",
      y = "*Flipper length* (mm)",
      title = "**Example plot**",
      subtitle = "Plot subtitle"
    ) +
    theme_wjake()

  vdiffr::expect_doppelganger("default-scatter", p)
})
