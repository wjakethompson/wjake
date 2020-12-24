#' wjake: A package for package installation and miscellaneous functions
#'
#' Personal package for helping with R setup and random tasks that I Google too
#' often.
#'
#' @docType package
#' @name wjake
#' @aliases wjake
#' @importFrom rlang .data
NULL

## Make R CMD Check go away
if (getRversion() >= "2.15.1") utils::globalVariables(c("."))
