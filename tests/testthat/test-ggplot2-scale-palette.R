test_that("scale palette can be customized", {
  expect_true(is.environment(scale_palette(
    aesthetics = "fill",
    palette = palette_okabeito
  )))

  p <- ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
    geom_point(aes(color = species), na.rm = TRUE) +
    scale_palette(aesthetics = "color", palette = palette_okabeito)
  vdiffr::expect_doppelganger("default-scale", p)

  p <- ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
    geom_point(aes(color = species), na.rm = TRUE) +
    scale_palette(
      aesthetics = "color",
      palette = palette_okabeito,
      order = c(2, 4, 6),
      darken = 0.2
    )
  vdiffr::expect_doppelganger("darken-even", p)

  p <- ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
    geom_point(aes(color = species), na.rm = TRUE) +
    scale_palette(
      aesthetics = "color",
      palette = palette_okabeito,
      order = c(3, 5, 7),
      darken = -0.2,
      alpha = 0.6
    )
  vdiffr::expect_doppelganger("lighten-alpha-odd", p)

  p <- ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
    geom_point(aes(color = species), na.rm = TRUE) +
    scale_palette(aesthetics = "color", palette = palette_okabeito, order = 1:2)
  expect_warning(ggplot_build(p), "Insufficient values in manual scale.")
})
