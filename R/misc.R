#' Create an announcement adjective
#'
#' @return A character string
#' @export
#'
#' @examples
#' announce()
announce <- function() {
  phrases <- list(
    chuffed = c(""),
    pleased = c("", "most", "very", "extremely", "well"),
    stoked = c(""),
    chuffed = c("", "very"),
    happy = c("", "so", "very", "exceedingly"),
    thrilled = c(""),
    delighted = c(""),
    `tickled pink` = c(""),
    ecstatic = c(""),
    elated = c(""),
    excited = c("", "remarkably"),
    euphoric = c(""),
    overjoyed = c("")
  )
  i <- sample(length(phrases), 1)
  word <- names(phrases)[[i]]
  modifier <- sample(phrases[[i]], 1)
  paste0(modifier, if (modifier != "") " ", word)
}

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
  if (cur_length < (width - 2)) {
    rstudioapi::insertText(
      glue::glue(" {paste(rep('-', width - cur_length), collapse = '')}")
    )
  }
}
