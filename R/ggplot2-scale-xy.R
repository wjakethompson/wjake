#' X & Y scales for percent and comma labels
#'
#' Wrappers around [ggplot2::continuous_scale()] that provide automatic percent
#' or comman formatting.
#'
#' @param ... Additional arguments passed to [ggplot2::scale_x_continuous()] or
#'   [ggplot2::scale_y_continuous()].
#'
#' @returns A ggplot2 continuous scale.
#'
#' @name xy_scales
#' @export
#' @examples
#' set.seed(1234)
#' ggplot() +
#'   geom_point(aes(x = sample(1000:9999, size = 100), y = runif(100, 0, 1))) +
#'   scale_x_comma() +
#'   scale_y_percent(breaks = seq(0, 1, by = .2))
scale_x_comma <- function(...) {
  scale_x_continuous(labels = scales::label_comma(), ...)
}

#' @rdname xy_scales
#' @export
scale_y_comma <- function(...) {
  scale_y_continuous(labels = scales::label_comma(), ...)
}

#' @rdname xy_scales
#' @export
scale_x_percent <- function(...) {
  scale_x_continuous(labels = scales::label_percent(), ...)
}

#' @rdname xy_scales
#' @export
scale_y_percent <- function(...) {
  scale_y_continuous(labels = scales::label_percent(), ...)
}
