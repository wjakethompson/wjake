#' Palette color scale
#'
#' This is a qualitative scale using the color palette used for
#' https://wjakethompson.com. See [palette_wjake] for details.
#'
#' @param palette A character vector of the color palette to use in the scale
#'   (e.g., [palette_wjake], [palette_okabeito]).
#' @param order Numeric vector listing the order in which the colors should be
#'   used. Default is the order of the palette vector.
#' @param darken Relative amount by which the scale should be darkened (for
#'   positive values) or lightened (for negative values).
#' @param alpha Alpha transparency level of the color. Default is no
#'   transparency.
#' @param ... common discrete scale parameters: `name`, `breaks`, `labels`,
#'   `na.value`, `limits`, `guide`, and `aesthetics`. See [discrete_scale] for
#'   more details.
#'
#' @export
#' @examples
#' library(ggplot2)
#'
#' ggplot(penguins, aes(x = bill_len, y = flipper_len, color = species)) +
#'   geom_point() +
#'   scale_color_wjake()
#'
#' ggplot(penguins, aes(bill_len, fill = species)) +
#'   geom_density(alpha = 0.7) +
#'   scale_fill_okabeito(order = c(1, 2, 5))
#'
#' @usage NULL
scale_palette <- function(
  aesthetics,
  palette,
  order = seq_along(palette),
  darken = 0,
  alpha = NA,
  ...
) {
  values <- palette[order]

  n <- length(values)
  darken <- rep_len(darken, n)
  alpha <- rep_len(alpha, n)

  di <- darken > 0
  if (sum(di) > 0) {
    values[di] <- colorspace::darken(values[di], amount = darken[di])
  }

  li <- darken < 0
  if (sum(li) > 0) {
    values[li] <- colorspace::lighten(values[li], amount = -1 * darken[li])
  }

  ai <- !is.na(alpha)
  if (sum(ai) > 0) {
    values[ai] <- scales::alpha(values[ai], alpha[ai])
  }

  pal <- function(n) {
    if (n > length(values)) {
      warning(
        "Insufficient values in manual scale. ",
        n,
        " needed but only ",
        length(values),
        " provided.",
        call. = FALSE
      )
    }
    values
  }
  ggplot2::discrete_scale(aesthetics, palette = pal, ...)
}
