#' Website color palette
#'
#' Color palette used for theming https://wjakethompson.com.
#' @export
palette_wjake <- c("#F0F0F0", "#272727", "#FED766", "#009FB7", "#696773")



#' Custom color ramps
#'
#' These color ramp functions create color scales that can be used for making
#' ggplot2 plots and gt tables. Color ramps are based on the [palette_wjake]
#' color palette.
#'
#' @inheritParams grDevices::colorRamp
#' @param x Colors to pull from the color ramp. Numbers range from 0-1, which
#'   is a normalized sliding scale of the color ramp.
#'
#' @details
#' `make_color_pal` can be used to create a color ramp function for any set of
#' valid colors.
#'
#' `ramp_blue`, `ramp_yellow`, and `ramp_yelblu` are pre-made color ramps based
#' on the blue and yellow colors from the [palette_wjake] color palette.
#'
#' @name color_ramp

#' @rdname color_ramp
#' @export
make_color_pal <- function(colors, bias = 1) {
  get_color <- colorRamp(colors, bias = bias)
  function(x) rgb(get_color(x), maxColorValue = 255)
}

#' @rdname color_ramp
#' @export
ramp_blue <- make_color_pal(c("#FFFFFF", "#009FB7"), bias = 1)

#' @rdname color_ramp
#' @export
ramp_yellow <- make_color_pal(c("#FFFFFF", "#FED766"), bias = 1)

#' @rdname color_ramp
#' @export
ramp_yelblu <- make_color_pal(c("#FED766", "#FFFFFF", "#009FB7"), bias = 1)
