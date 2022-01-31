#' Personalized ggplot2 theme
#'
#' Based on [hrbrthemes::theme_ipsum].
#'
#' @inheritParams hrbrthemes::theme_ipsum
#' @param ... Additional parameters passed to [hrbrthemes::theme_ipsum]
#'
#' @export
#'
#' @examples \dontrun{
#' library(ggplot2)
#'
#' # seminal scatterplot
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(x = "Fuel efficiency (mpg)", y = "Weight (tons)",
#'        title = "Seminal ggplot2 scatterplot example",
#'        subtitle = "A plot that is only useful for demonstration purposes",
#'        caption = "Brought to you by the letter 'g'") +
#'   theme_wjake()
#' }
theme_wjake <- function(base_family = "Arial Narrow", base_size = 11.5, ...) {
  ret <- hrbrthemes::theme_ipsum(base_family = base_family,
                                 base_size = base_size, ...)

  ret <- ret +
    ggplot2::theme(legend.background = ggplot2::element_blank(),
                   legend.key = ggplot2::element_blank(),
                   legend.position = "bottom",
                   strip.text.x = ggtext::element_markdown(),
                   strip.text.y = ggtext::element_markdown(),
                   axis.title.x = ggtext::element_markdown(),
                   axis.title.y = ggtext::element_markdown())

  ret
}

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#'
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family = "Arial Narrow",
                                      face = "plain", size = 3.5,
                                      color = "#2b2b2b") {
  ggplot2::update_geom_defaults("text", list(family = family, face = face,
                                             size = size, color = color))
  ggplot2::update_geom_defaults("label", list(family = family, face = face,
                                              size = size, color = color))
}


#' Set global plot theme options
#'
#' @inheritParams hrbrthemes::theme_ipsum
#' @param v_option Viridis scale for continuous variables. See
#'   [ggplot2::scale_colour_viridis_c].
#' @param d_scale Discrete color scale to use.
#' @param ... Additional parameters passed to [theme_wjake()].
#'
#' @export
set_theme <- function(base_family = "Arial Narrow",
                      v_option = c("viridis", "magma", "inferno", "plasma",
                                   "cividis", "A", "B", "C", "D", "E"),
                      d_scale = c("okabeito", "wjake"), ...) {
  v_option <- match.arg(v_option)
  d_scale <- match.arg(d_scale)

  ggplot2::theme_set(theme_wjake(base_family = base_family, ...))
  update_geom_font_defaults(family = base_family)

  cont_fill <- function(..., option = v_option) {
    ggplot2::scale_fill_continuous(..., option = option, type = "viridis")
  }
  cont_colr <- function(..., option = v_option) {
    ggplot2::scale_colour_continuous(..., option = option, type = "viridis")
  }

  disc_fill <- switch(d_scale,
                      wjake = scale_fill_wjake,
                      okabeito = scale_fill_okabeito)
  disc_colr <- switch(d_scale,
                      wjake = scale_colour_wjake,
                      okabeito = scale_colour_okabeito)

  options(ggplot2.discrete.fill = disc_fill,
          ggplot2.discrete.colour = disc_colr,
          ggplot2.continuous.fill = cont_fill,
          ggplot2.continuous.colour = cont_colr)
}

#' @rdname ArialNarrow
#' @md
#' @title Arial Narrow font name R variable aliases
#' @description `font_an` == "`Arial Narrow`"
#' @format length 1 character vector
#' @export
font_an <- "Arial Narrow"