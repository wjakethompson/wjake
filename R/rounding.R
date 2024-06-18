#' Round to a Specified Value
#'
#' @param x A numeric value to round.
#' @param accuracy The accuracy with which to round (i.e., round to the nearest
#'   `accuracy`).
#' @param direction The direction to round. `nearest` (default) will round to
#'   the nearest `accuracy`, `up` will round up to the nearest `accuracy`,
#'   `down` will round down to the nearest `accuracy`, and `random` will
#'   randomly round up or down to the nearest `accuracy` as described by
#'   Matthews & Harel (2011).
#'
#' @return A numeric rounded to the specified accuracy.
#' @export
#'
#' @references Matthews, G., & Harel, O. (2011). Data confidentiality: A review
#'   of methods for statistical disclosure limitation and methods for assessing
#'   privacy. *Statistics Surveys, 5*, 1--29. \doi{10.1214/11-SS074}
#'
#' @examples
#' round_to(15, accuracy = 7, direction = "nearest")
#' round_to(15, accuracy = 7, direction = "up")
#' round_to(20, accuracy = 7, direction = "down")
round_to <- function(x, accuracy,
                     direction = c("nearest", "up", "down", "random")) {
  direction <- rlang::arg_match(direction)


  switch(direction,
    nearest = round_nr(x, accuracy),
    up = round_up(x, accuracy),
    down = round_dn(x, accuracy),
    random = round_rand(x, accuracy)
  )
}

round_nr <- function(x, accuracy) {
  round(x / accuracy) * accuracy
}

round_dn <- function(x, accuracy) {
  floor(x / accuracy) * accuracy
}

round_up <- function(x, accuracy) {
  ceiling(x / accuracy) * accuracy
}

round_rand <- function(x, accuracy) {
  if (accuracy == 0) return(x)
  if (x && accuracy == 0) return(x)

  dn <- round_dn(x, accuracy)
  up <- round_up(x, accuracy)

  probs <- 1 - c((x - dn) / accuracy,
                 (up - x) / accuracy)

  sample(c(dn, up), prob = probs, size = 1, replace = FALSE)
}
