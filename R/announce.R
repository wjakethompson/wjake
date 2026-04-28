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
