#' Personalized ggplot2 theme
#'
#' Based on [ggplot2::theme_minimal()].
#'
#' @inheritParams ggplot2::theme_minimal
#' @param continuous A character vector of valid colors that will be
#'   interpolated into a continuous color scale.
#' @param discrete A character vector of colors to use for discrete color
#'   scales.
#' @param transparent Logical indicator for whether the background of the plot
#'   should be transparent.
#' @param ... Additional parameters passed to [ggplot2::theme()].
#'
#' @export
#'
#' @examples \dontrun{
#' library(ggplot2)
#'
#' ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
#'   geom_point(aes(color = species), na.rm = TRUE) +
#'   labs(
#'     x = "Bill length (mm)",
#'     y = "Flipper length (mm)",
#'     title = "Seminal ggplot2 scatterplot example",
#'     subtitle = "A plot that is only useful for demonstration purposes",
#'     caption = "Brought to you by 🐧",
#'     color = "Species"
#'   ) +
#'   theme_wjake()
#' }
theme_wjake <- function(
  base_size = 11.5,
  base_family = "Source Sans Pro",
  header_family = NULL,
  base_line_size = base_size / 22,
  base_rect_size = base_size / 22,
  ink = "black",
  paper = "white",
  accent = "#FED766",
  continuous = ramp_blue(c(0.1, 1), end = "#FFFFFF"),
  discrete = palette_wjake,
  transparent = FALSE,
  ...
) {
  wjt_theme <- ggplot2::theme_minimal(
    base_size = base_size,
    base_family = base_family,
    header_family = header_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size,
    ink = ink,
    paper = paper,
    accent = accent
  ) +
    ggplot2::theme_sub_legend(
      background = ggplot2::element_blank(),
      key = element_blank(),
      position = "bottom"
    ) +
    ggplot2::theme_sub_axis_bottom(
      title = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size * .8,
        hjust = 1
      ),
      text = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size
      )
    ) +
    ggplot2::theme_sub_axis_top(
      title = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size * .8,
        hjust = 1
      ),
      text = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size
      )
    ) +
    ggplot2::theme_sub_axis_left(
      title = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size * .8,
        hjust = 1
      ),
      text = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size
      )
    ) +
    ggplot2::theme_sub_axis_right(
      title = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size * .8,
        hjust = 1
      ),
      text = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size
      )
    ) +
    ggplot2::theme_sub_strip(
      text = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size
      )
    ) +
    ggplot2::theme_sub_panel(
      spacing = unit(1, "lines")
    ) +
    ggplot2::theme_sub_plot(
      title = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size * 1.5
      ),
      title.position = "plot",
      subtitle = ggtext::element_markdown(
        family = base_family,
        color = "black",
        size = base_size * 1.2
      )
    ) +
    ggplot2::theme(
      geom = ggplot2::element_geom(
        ink = palette_wjake[1]
      ),
      palette.color.continuous = continuous,
      palette.fill.continuous = continuous,
      palette.color.discrete = discrete,
      palette.fill.discrete = discrete,
      ...
    )

  if (transparent) {
    wjt_theme <- wjt_theme +
      ggplot2::theme(
        plot.background = ggplot2::element_rect(
          fill = "transparent",
          color = "transparent"
        ),
        panel.background = ggplot2::element_rect(
          fill = "transparent",
          color = "transparent"
        ),
        legend.background = ggplot2::element_rect(
          fill = "transparent",
          color = "transparent"
        ),
        panel.border = ggplot2::element_blank()
      )
  }

  wjt_theme
}
