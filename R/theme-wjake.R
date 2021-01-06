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
theme_wjake <- function(base_family = "Arial Narrow", ...) {
  ret <- hrbrthemes::theme_ipsum(base_family = base_family, ...)

  ret <- ret + ggplot2::theme(legend.background = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(legend.key = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(legend.position = "bottom")

  ret
}

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#'
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family = "Arial Narrow", face = "plain",
                                      size = 3.5, color = "#2b2b2b") {
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
#' @param ... Additional parameters passed to [theme_wjake()].
#'
#' @export
set_theme <- function(base_family = "Arial Narrow", v_option = "D", ...) {
  ggplot2::theme_set(theme_wjake(base_family = base_family, ...))
  update_geom_font_defaults(family = base_family)

  cont_fill <- function(..., option = v_option) {
    ggplot2::scale_fill_continuous(..., option = option, type = "viridis")
  }
  cont_colr <- function(..., option = v_option) {
    ggplot2::scale_colour_continuous(..., option = option, type = "viridis")
  }

  options(ggplot2.discrete.fill = ratlas::scale_fill_okabeito,
          ggplot2.discrete.colour = ratlas::scale_colour_okabeito,
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