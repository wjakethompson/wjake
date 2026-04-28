#' Custom color ramps
#'
#' These color ramp functions create color scales that can be used for making
#' ggplot2 plots and gt tables. Color ramps are based on the [palette_wjake]
#' color palette.
#'
#' @inheritParams grDevices::colorRamp
#' @param output Colors to pull from the color ramp. Numbers range from 0-1,
#'   which is a normalized sliding scale of the color ramp.
#' @param end The end color that the base color should fade into.
#' @param mid For pre-made diverging palettes, the color of the midpoint of the
#'   scale.
#'
#' @details
#' [make_color_pal()] can be used to create a color ramp function for any set of
#' valid colors.
#'
#' [ramp_blue()], [ramp_yellow()], and [ramp_yelblu()] are pre-made color ramps
#' based on the blue and yellow colors from the [palette_wjake] color palette.
#'
#' [ramp_orgblu()] is a pre-made color ramp based on the first two colors from
#' the [palette_okabeito] color palette.
#'
#' @name color_ramp

#' @rdname color_ramp
#' @export
#' @examples
#' new_ramp <- make_color_pal(c("red", "grey", "blue"))
#' new_ramp(seq(0, 1, length.out = 10))
#'
#' # Pre-made palettes
#' ramp_blue(seq(0, 1, by = 0.2))
#' ramp_yellow(seq(0.2, 1, length.out = 5))
make_color_pal <- function(colors, bias = 1) {
  get_color <- grDevices::colorRamp(colors, bias = bias)
  function(x) rgb(get_color(x), maxColorValue = 255)
}

#' @rdname color_ramp
#' @export
ramp_blue <- function(output, end = "#FFFFFF") {
  ramp <- make_color_pal(c(end, "#009FB7"), bias = 1)
  ramp(output)
}

#' @rdname color_ramp
#' @export
ramp_yellow <- function(output, end = "#FFFFFF") {
  ramp <- make_color_pal(c(end, "#FED766"), bias = 1)
  ramp(output)
}

#' @rdname color_ramp
#' @export
ramp_yelblu <- function(output, mid = "#F0F0F0") {
  ramp <- make_color_pal(c("#FED766", mid, "#009FB7"), bias = 1)
  ramp(output)
}

#' @rdname color_ramp
#' @export
ramp_orgblu <- function(output, mid = "#999999") {
  ramp <- make_color_pal(c("#E69F00", mid, "#56B4E9"), bias = 1)
  ramp(output)
}
