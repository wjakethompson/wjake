test_that("okabe ito palette is correct", {
  expect_equal(
    palette_okabeito,
    c(
      "#E69F00",
      "#56B4E9",
      "#009E73",
      "#F5C710",
      "#0072B2",
      "#D55E00",
      "#CC79A7",
      "#000000"
    )
  )
})

test_that("okabe ito scales work", {
  p <- ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
    geom_point(aes(color = species), na.rm = TRUE) +
    theme_bw()
  vdiffr::expect_doppelganger("okabeito-color", p + scale_color_okabeito())
  vdiffr::expect_doppelganger("okabeito-colour", p + scale_colour_okabeito())

  p <- ggplot(penguins, aes(x = bill_len)) +
    geom_density(aes(fill = species), na.rm = TRUE, alpha = 0.6) +
    scale_fill_okabeito()
  vdiffr::expect_doppelganger("okabeito-fill", p)
})
