#' Title
#'
#' @param data The gt table data object.
#' @param dec_dig The number of decimal places to round to for numeric values.
#' @param corr_dig The number of decimal places to round to for numeric values
#'   all constrained to be between \[-1, 1\].
#' @param fmt_extreme Logical indicator for whether values close to extremes
#'   should be suppressed (e.g., .000001 becomes <.001).
#' @param bg_color The background color of the table.
#' @param font The font to use for the table.
#' @param font_size The base font size for the table.
#' @param ... Additional options passed to [gt::tab_options()]
#'
#' @returns An object of class `gt-tbl`.
#'
#' @export
#' @examples
#' gt::gt(head(penguins)) |>
#'   gt_theme_apa() |>
#'   gt::fmt_number(year, sep_mark = "", decimals = 0)
gt_theme_apa <- function(
  data,
  dec_dig = 1,
  corr_dig = 3,
  fmt_extreme = TRUE,
  bg_color = "#FFFFFF",
  font = "Arial",
  font_size = 11,
  ...
) {
  # general formatting -----
  data <- data |>
    gt::cols_align_decimal(columns = dplyr::where(is.numeric)) |>
    gt::opt_table_font(font = list(font))

  # number formatting -----
  data <- data |>
    ## integers
    gt::fmt_number(columns = dplyr::where(is.integer), decimals = 0) |>

    ## numerics
    gt::fmt_number(
      columns = dplyr::where(\(x) {
        is.double(x) && !all(dplyr::between(x, -1, 1))
      }),
      decimals = dec_dig
    ) |>

    ## proportions and correlations bounded [-1, 1]
    gt::fmt_number(
      columns = dplyr::where(\(x) {
        is.double(x) && all(dplyr::between(x, -1, 1))
      }),
      decimals = 3
    )

  # extreme value formatting -----
  if (fmt_extreme) {
    data <- data |>
      gt::sub_small_vals(
        columns = dplyr::where(\(x) {
          is.double(x) && !all(dplyr::between(x, -1, 1))
        }),
        threshold = 1 / (10^dec_dig)
      ) |>
      gt::sub_large_vals(
        columns = dplyr::where(\(x) {
          is.double(x) && !all(dplyr::between(x, -1, 1))
        }),
        threshold = 100 - (1 / (10^dec_dig)),
        large_pattern = ">{x}"
      ) |>
      gt::sub_large_vals(
        columns = dplyr::where(\(x) {
          is.double(x) && all(dplyr::between(x, -1, 1))
        }),
        threshold = 1 - (1 / (10^corr_dig)),
        large_pattern = ">{x}"
      ) |>
      gt::sub_large_vals(
        columns = dplyr::where(\(x) {
          is.double(x) && all(dplyr::between(x, -1, 1))
        }),
        threshold = 1 - (1 / (10^corr_dig)),
        large_pattern = "<\U2212{x}",
        sign = "-"
      )
  }

  # group formatting -----
  if (length(data$`_row_groups`)) {
    data <- data |>
      gt::tab_style(
        style = gt::cell_text(indent = gt::px(20)),
        locations = gt::cells_body(
          columns = 1,
          rows = gt::everything()
        )
      )
  }

  # table styling -----
  data <- data |>
    gt::text_transform(
      fn = \(x) gsub("0\\.", ".", x),
      locations = gt::cells_body(
        columns = dplyr::where(\(x) {
          is.double(x) && all(dplyr::between(x, -1, 1))
        }),
        rows = gt::everything()
      )
    ) |>
    gt::tab_options(
      table.align = "left",
      table.background.color = bg_color
    ) |>
    gt::tab_options(
      table.font.size = font_size,
      source_notes.font.size = font_size * .8,
      data_row.padding = gt::px(3),
      row_group.padding = gt::px(4),
      table_body.hlines.style = "none",
      row_group.border.top.style = "none",
      row_group.border.bottom.style = "none",
      table.border.top.style = "none",
      table.border.bottom.style = "none",
      column_labels.border.top.style = "solid",
      column_labels.border.top.width = gt::px(1),
      column_labels.border.top.color = "black",
      column_labels.border.bottom.style = "solid",
      column_labels.border.bottom.width = gt::px(1),
      column_labels.border.bottom.color = "black",
      table_body.border.top.style = "none",
      table_body.border.bottom.style = "solid",
      table_body.border.bottom.width = gt::px(1),
      table_body.border.bottom.color = "black",
      ...
    ) |>
    gt::tab_style(
      style = list(
        gt::cell_text(align = "center", v_align = "middle")
      ),
      locations = gt::cells_column_labels(gt::everything())
    )

  data
}
