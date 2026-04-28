#' wjake: A package for package installation and miscellaneous functions
#'
#' Personal package for helping with R setup and random tasks that I Google too
#' often.
#'
#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @import ggplot2
#' @import rlang
#' @importFrom tibble tibble
## usethis namespace: end
NULL

## Make R CMD Check go away
if (getRversion() >= "2.15.1") {
  utils::globalVariables(c("."))
}
