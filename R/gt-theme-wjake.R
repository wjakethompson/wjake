#' Personalized gt theme
#'
#' A custom theme for tables generated with [gt::gt()].
#'
#' @inheritParams gt_theme_apa
#' @param ... Additional arguments passed to [gt_theme_apa()] and
#'   [gt::tab_options()].
#'
#' @return An object of class `gt_tbl`.
#' @export
gt_theme_wjake <- function(data, bg_color = "#F0F0F0", font_size = 16, ...) {
  data |>
    gt::tab_source_note("Table: @wjakethompson.com") |>
    gt_theme_apa(
      font = "Source Sans Pro",
      bg_color = bg_color,
      font_size = font_size,
      ...
    ) |>
    gt::opt_all_caps(locations = "column_labels") |>
    gt::tab_options(
      table_body.hlines.style = "solid",
      table.border.top.style = "solid",
      table.border.top.color = "#A8A8A8",
      table.border.top.width = gt::px(1),
      table.border.bottom.style = "solid",
      table.border.bottom.color = "#A8A8A8",
      table.border.bottom.width = gt::px(1),
      table_body.border.bottom.style = "solid",
      table_body.border.bottom.width = gt::px(2),
      table_body.border.bottom.color = "#D3D3D3",
      column_labels.border.top.style = "none",
      column_labels.border.bottom.style = "solid",
      column_labels.border.bottom.width = gt::px(3),
      column_labels.border.bottom.color = "black",
      heading.border.bottom.style = "none",
      heading.align = "left",
      source_notes.padding = gt::px(10),
      source_notes.border.lr.width = gt::px(0),
      data_row.padding = gt::px(3)
    ) |>
    gt::tab_style(
      style = list(gt::cell_text(transform = "uppercase", align = "right")),
      locations = gt::cells_source_notes()
    ) |>
    gt::tab_style(
      style = list(gt::cell_text(weight = "bold")),
      locations = gt::cells_title()
    )
}
