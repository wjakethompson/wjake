test_that("wjake palette is correct", {
  expect_equal(
    palette_wjake,
    c(
      "#009FB7",
      "#FED766",
      "#272727",
      "#696773",
      "#F0F0F0"
    )
  )
})

test_that("okabe ito scales work", {
  p <- ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
    geom_point(aes(color = species), na.rm = TRUE) +
    theme_bw()
  vdiffr::expect_doppelganger("wjake-color", p + scale_color_wjake())
  vdiffr::expect_doppelganger("wjake-colour", p + scale_colour_wjake())

  p <- ggplot(penguins, aes(x = bill_len)) +
    geom_density(aes(fill = species), na.rm = TRUE, alpha = 0.6) +
    scale_fill_wjake()
  vdiffr::expect_doppelganger("wjake-fill", p)
})
