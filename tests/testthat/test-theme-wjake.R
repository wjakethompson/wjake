context("theme-wjake")

thm <- theme_wjake()

test_that("theme_wjake is a theme", {
  expect_s3_class(thm, "theme")
})

test_that("theme_wjake uses Arial Narrow font", {
  expect_equal(thm$text$family, "Arial Narrow")
  expect_equal(thm$plot.title$family, "Arial Narrow")
  expect_equal(thm$plot.subtitle$family, "Arial Narrow")
  expect_equal(thm$plot.caption$family, "Arial Narrow")
  expect_equal(thm$strip.text$family, "Arial Narrow")
  expect_equal(thm$axis.title$family, "Arial Narrow")
  expect_null(thm$axis.text$family)
  expect_null(thm$legend.text$family)
})

test_that("theme_wjake font sizes are correct", {
  expect_equal(thm$text$size, 11.5)
  expect_equal(thm$plot.title$size, 18)
  expect_equal(thm$plot.subtitle$size, 12)
  expect_equal(thm$strip.text$size, 12)
  expect_equal(thm$plot.caption$size, 9)
  expect_equal(thm$axis.title$size, 9)
})

test_that("theme_wjake font colors are correct", {
  expect_equal(thm$text$colour, "black")
  expect_equal(thm$axis.text$colour, "grey30")
})

test_that("theme_wjake grids, axis, and ticks are correct", {
  expect_equal(invisible(theme_wjake(grid = FALSE)),
               theme_wjake(grid = FALSE))
  expect_equal(invisible(theme_wjake(grid = "XY")),
               theme_wjake(grid = "XY"))
  expect_equal(invisible(theme_wjake(grid = "xy")),
               theme_wjake(grid = "xy"))

  expect_equal(invisible(theme_wjake(axis = TRUE)),
               theme_wjake(axis = TRUE))

  expect_equal(invisible(theme_wjake(axis = FALSE)),
               theme_wjake(axis = FALSE))
  expect_equal(invisible(theme_wjake(axis = "xy")),
               theme_wjake(axis = "xy"))
  expect_equal(invisible(theme_wjake(axis = "")),
               theme_wjake(axis = ""))
  expect_equal(invisible(theme_wjake(ticks = TRUE)),
               theme_wjake(ticks = TRUE))
})

test_that("update_geom_font_defaults() works", {
  expect_equal(update_geom_font_defaults(),
               ggplot2::update_geom_defaults("text",
                                             list(family = "Arial Narrow",
                                                  face = "plain", size = 3.5,
                                                  color = "#2b2b2b")))
})

# Set theme --------------------------------------------------------------------
test_that("theme_wjake is a theme", {
  local_theme(font = "Arial Narrow", continuous = "D")
  thm <- theme_get()

  expect_s3_class(thm, "theme")
})

test_that("theme_wjake uses Arial Narrow font", {
  local_theme(font = "Arial Narrow", continuous = "D")
  thm <- theme_get()

  expect_equal(thm$text$family, "Arial Narrow")
  expect_equal(thm$plot.title$family, "Arial Narrow")
  expect_equal(thm$plot.subtitle$family, "Arial Narrow")
  expect_equal(thm$plot.caption$family, "Arial Narrow")
  expect_equal(thm$strip.text$family, "Arial Narrow")
  expect_equal(thm$axis.title$family, "Arial Narrow")
  expect_null(thm$axis.text$family)
  expect_null(thm$legend.text$family)
})

test_that("theme_wjake font sizes are correct", {
  local_theme(font = "Arial Narrow", continuous = "D")
  thm <- theme_get()

  expect_equal(thm$text$size, 11.5)
  expect_equal(thm$plot.title$size, 18)
  expect_equal(thm$plot.subtitle$size, 12)
  expect_equal(thm$strip.text$size, 12)
  expect_equal(thm$plot.caption$size, 9)
  expect_equal(thm$axis.title$size, 9)
})

test_that("theme_wjake font colors are correct", {
  local_theme(font = "Arial Narrow", continuous = "D")
  thm <- theme_get()

  expect_equal(thm$text$colour, "black")
  expect_equal(thm$axis.text$colour, "grey30")
})

test_that("theme_wjake grids, axis, and ticks are correct", {
  local_theme(font = "Arial Narrow", continuous = "D")
  thm <- theme_get()

  expect_equal(invisible(theme_wjake(grid = FALSE)),
               theme_wjake(grid = FALSE))
  expect_equal(invisible(theme_wjake(grid = "XY")),
               theme_wjake(grid = "XY"))
  expect_equal(invisible(theme_wjake(grid = "xy")),
               theme_wjake(grid = "xy"))

  expect_equal(invisible(theme_wjake(axis = TRUE)),
               theme_wjake(axis = TRUE))

  expect_equal(invisible(theme_wjake(axis = FALSE)),
               theme_wjake(axis = FALSE))
  expect_equal(invisible(theme_wjake(axis = "xy")),
               theme_wjake(axis = "xy"))
  expect_equal(invisible(theme_wjake(axis = "")),
               theme_wjake(axis = ""))
  expect_equal(invisible(theme_wjake(ticks = TRUE)),
               theme_wjake(ticks = TRUE))
})

# Colors -----------------------------------------------------------------------
library(ggplot2)

test_that("magma works", {
  local_theme(font = "Arial Narrow", continuous = "magma")
  thm <- theme_get()

  plot_f <- ggplot(faithfuld, aes(waiting, eruptions)) +
    geom_raster(aes(fill = density)) +
    thm
  plot_c <- ggplot(economics, aes(unemploy / pop, psavert)) +
    geom_path(aes(color = as.numeric(date))) +
    thm

  vdiffr::expect_doppelganger("magma_f", plot_f)
  vdiffr::expect_doppelganger("magma_c", plot_c)
})

test_that("inferno works", {
  local_theme(font = "Arial Narrow", continuous = "inferno")
  thm <- theme_get()

  plot_f <- ggplot(faithfuld, aes(waiting, eruptions)) +
    geom_raster(aes(fill = density)) +
    thm
  plot_c <- ggplot(economics, aes(unemploy / pop, psavert)) +
    geom_path(aes(color = as.numeric(date))) +
    thm

  vdiffr::expect_doppelganger("inferno_f", plot_f)
  vdiffr::expect_doppelganger("inferno_c", plot_c)
})

test_that("plasma works", {
  local_theme(font = "Arial Narrow", continuous = "plasma")
  thm <- theme_get()

  plot_f <- ggplot(faithfuld, aes(waiting, eruptions)) +
    geom_raster(aes(fill = density)) +
    thm
  plot_c <- ggplot(economics, aes(unemploy / pop, psavert)) +
    geom_path(aes(color = as.numeric(date))) +
    thm

  vdiffr::expect_doppelganger("plasma_f", plot_f)
  vdiffr::expect_doppelganger("plasma_c", plot_c)
})

test_that("viridis works", {
  local_theme(font = "Arial Narrow", continuous = "viridis")
  thm <- theme_get()

  plot_f <- ggplot(faithfuld, aes(waiting, eruptions)) +
    geom_raster(aes(fill = density)) +
    thm
  plot_c <- ggplot(economics, aes(unemploy / pop, psavert)) +
    geom_path(aes(color = as.numeric(date))) +
    thm

  vdiffr::expect_doppelganger("viridis_f", plot_f)
  vdiffr::expect_doppelganger("viridis_c", plot_c)
})

test_that("cividis works", {
  local_theme(font = "Arial Narrow", continuous = "cividis")
  thm <- theme_get()

  plot_f <- ggplot(faithfuld, aes(waiting, eruptions)) +
    geom_raster(aes(fill = density)) +
    thm
  plot_c <- ggplot(economics, aes(unemploy / pop, psavert)) +
    geom_path(aes(color = as.numeric(date))) +
    thm

  vdiffr::expect_doppelganger("cividis_f", plot_f)
  vdiffr::expect_doppelganger("cividis_c", plot_c)
})

test_that("okabe ito works", {
  local_theme(font = "Arial Narrow", continuous = "viridis")
  thm <- theme_get()

  df <- data.frame(
    x = rep(c(2, 5, 7, 9, 12), 2),
    y = rep(c(1, 2), each = 5),
    z = factor(rep(1:5, each = 2)),
    w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
  )

  plot_f <- ggplot(df, aes(x, y)) +
    geom_tile(aes(fill = z), colour = "grey50") +
    thm
  plot_c <- ggplot(economics_long, aes(date, value01, colour = variable)) +
    geom_line() +
    thm

  vdiffr::expect_doppelganger("okabeito_f", plot_f)
  vdiffr::expect_doppelganger("okabeito_c", plot_c)
})