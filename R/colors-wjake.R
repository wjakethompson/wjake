#' Personal color palette
#'
#' Color palette used for theming https://wjakethompson.com. The palette also
#' includes color scales that can be used in place of
#' [ggplot2::scale_color_discrete()] or [ggplot2::scale_fill_discrete()].
#'
#' @export
#' @examples
#' scales::show_col(palette_wjake)
palette_wjake <- c(
  "#009FB7",
  "#FED766",
  "#272727",
  "#696773",
  "#F0F0F0"
)

#' @rdname palette_wjake
#' @export
#' @usage NULL
scale_colour_wjake <- function(aesthetics = "colour", ...) {
  scale_palette(aesthetics, palette = palette_wjake, ...)
}

#' @rdname palette_wjake
#' @export
#' @usage NULL
scale_color_wjake <- scale_colour_wjake

#' @rdname palette_wjake
#' @export
#' @usage NULL
scale_fill_wjake <- function(aesthetics = "fill", ...) {
  scale_palette(aesthetics, palette = palette_wjake, ...)
}
