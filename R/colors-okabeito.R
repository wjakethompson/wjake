#' Okabe-Ito color palette
#'
#' Colorblind friendly palette taken originally described by Okabe and Ito
#' (2008). The original palette has been modified slightly to make the yellow
#' more visible on a white background, as described by Lüdecke et al. (2021).
#' The palette also includes color scales that can be used in place of
#' [ggplot2::scale_color_discrete()] or [ggplot2::scale_fill_discrete()].
#'
#' @references Lüdecke, D., Patil, I., Ben-Shachar, M. S., Wiernik, B. M.,
#'   Waggoner, P., & Makowski, D. (2021). see: An R package for visualizing
#'   statistical models. *Journal of Open Source Software, 6*(64), Article 3393.
#'   \doi{10.21105/joss.03393}
#' @references Okabe, M., & Ito, K. (2008). Color universal design (CUD): How to
#'   make figures and presentations that are friendly to colorblind people.
#'   <https://jfly.uni-koeln.de/color/#pallet> (Original work published 2002)
#'
#' @export
#' @examples
#' scales::show_col(palette_okabeito)
palette_okabeito <- c(
  "#E69F00",
  "#56B4E9",
  "#009E73",
  "#F5C710",
  "#0072B2",
  "#D55E00",
  "#CC79A7",
  "#000000"
)

#' @rdname palette_okabeito
#' @export
#' @usage NULL
scale_colour_okabeito <- function(aesthetics = "colour", ...) {
  scale_palette(aesthetics, palette = palette_okabeito, ...)
}

#' @rdname palette_okabeito
#' @export
#' @usage NULL
scale_color_okabeito <- scale_colour_okabeito

#' @rdname palette_okabeito
#' @export
#' @usage NULL
scale_fill_okabeito <- function(aesthetics = "fill", ...) {
  scale_palette(aesthetics, palette = palette_okabeito, ...)
}
