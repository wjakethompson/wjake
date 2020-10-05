#' Create heading dividers
#'
#' Insert some hyphens padded to a specified console character width.
#'
#' @param width The width of console the hyphens should pad to
#'
#' @return A character string consisting of a ' ' and hyphens that fill to the
#'   specified `width`.
#' @export
code_heading <- function(width = 80) {
  cur_location <- rstudioapi::primary_selection(
    rstudioapi::getSourceEditorContext()
  )

  cur_length <- cur_location$range$start[2]
  rstudioapi::insertText(
    glue::glue(" {paste(rep('-', width - cur_length), collapse = '')}")
  )
}
