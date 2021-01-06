#' Personalized gt theme
#'
#' A custom theme for tables generated with [gt::gt].
#'
#' @param gt_dat A `gt_tbl` object, generated from [gt::gt].
#' @param bg_color The background color of the table cells.
#' @param ... Additional arguments passed to [gt::tab_options].
#'
#' @return An object of class `gt_tbl`.
#' @export
gt_theme_wjake <- function(data, bg_color = "#F0F0F0", ...) {
  data %>%
    opt_all_caps() %>%
    opt_table_font(font = list(google_font("Source Sans Pro"),
                               default_fonts())) %>%
    tab_options(column_labels.background.color = bg_color,
                column_labels.border.top.width = px(3),
                column_labels.border.top.color = bg_color,
                table.border.top.width = px(1),
                table.border.bottom.width = px(1),
                heading.align = "left",
                heading.background.color = bg_color,
                source_notes.padding = px(10),
                source_notes.border.lr.width = px(0),
                source_notes.font.size = 12,
                source_notes.background.color = bg_color,
                table.font.size = 16,
                data_row.padding = px(3),
                table.background.color = bg_color,
                ...) %>%
    tab_style(style = cell_borders(sides = "bottom", color = "transparent",
                                   weight = px(2)),
              locations = cells_body(columns = TRUE,
                                     rows = nrow(data$`_data`))) %>%
    tab_style(style = list(cell_text(weight = "bold", align = "center",
                                     v_align = "middle"),
                           cell_borders(sides = "bottom", color = "black",
                                        weight = px(3))),
              locations = cells_column_labels(TRUE)) %>%
    tab_style(style = cell_fill(color = bg_color),
              locations = list(cells_body(columns = gt::everything(),
                                          rows = gt::everything())))
}