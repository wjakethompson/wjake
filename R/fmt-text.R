#' Write APA Words
#'
#' Confused about whether a number should be written out ("five") or use
#' numerals ("5")? Use this function! Most useful for R Markdown in-text
#' writing.
#'
#' @param x The number to be printed
#' @param ordinal Do you want the ordinal numbering (e.g., 1st, 6th, etc.)
#' @param negative The word used to indicate a negative number.
#'
#' @family formatters
#' @return A character string
#' @export
#'
#' @examples
#' apa_words(5)
#' apa_words(16)
#' apa_words(6, ordinal = TRUE)
apa_words <- function(x, ordinal = FALSE, negative = "negative") {
  check_number_whole(x)
  check_bool(ordinal)

  output <- if (ordinal) {
    scales::ordinal(x, big.mark = ",") |>
      stringr::str_replace("-", "\U2212")
  } else {
    if (x > -10 && x < 10) {
      english::words(x) |>
        stringr::str_replace("^minus", negative)
    } else {
      fmt_digits(x, digits = 0)
    }
  }

  output
}

#' Text and Number Formatting
#'
#' These formatting functions are used to format numerical values in a
#' consistent manner. This is useful for printing numbers inline with text, as
#' well as for formatting tables.
#'
#' @param x Number to be formatted.
#' @param digits Number of decimal places to retain.
#' @param big_mark Character used between every 3 digits to separate thousands.
#' @param min_value The minimum value `x` can take.
#' @param max_value The maximum value `x` can take.
#' @param sub_threshold The threshold to use when replacing value extremely
#'   close to `min_value` or `max_value`. By default, this is determined by the
#'   `digits` specified.
#' @param keep_boundary Whether to preserve true values of boundaries (i.e.,
#'   `min_value` and `max_value`). For example if `digits = 3`, `min_value = 0`,
#'   and `keep_boundary = FALSE`, a value exactly equal to 0 will become
#'   "<.001". If `keep_boundary = TRUE`, then a value of 0 will remain "0.000",
#'   and other small values (e.g., 0.000001) will continue to be replaced with
#'   "<.001".
#' @param ... Additional arguments passed to [scales::number_format()] or
#'   [fmt_digits()]. See Details for additional information.
#'
#' @details
#' [fmt_digits()] is a wrapper for [scales::number_format()] and prints a number
#' with the specified number of digits, suppressing values close to the minimum
#' and maximum values as necessary.
#'
#' Several helper functions are provided that wrap [fmt_digits()] with common
#' patterns of `min_value`, `max_value`, and `digits`.
#'
#' * [fmt_count()] is used for formatting integer values. Prints whole numbers
#'   with no decimals.
#' * [fmt_corr()] is used to format correlations or similar indices that are
#'   bounded between \[-1, 1\]. By default, these values report 3 decimal
#'   places, and the leading 0 is removed as required by APA (2020; section
#'   6.36).
#' * [fmt_prop()] is used to format proportions or similar indices that are
#'   bounded between \[0, 1\]. Similar to [fmt_corr()], leading 0s are removed.
#'   By default, 2 decimal places are reported.
#' * [fmt_pct()] is used to format percentage values that are bounded
#'   \[0, 100\]. By default, no decimal places are reported.
#' * [fmt_prop_pct()] formats proportions bounded by \[0, 1\] as percentages.
#'   That is, we first take `x * 100` and then apply [fmt_pct()].
#'
#' @name formatting
#' @family formatters
#' @return The updated character object of the same length as `x`.
#'
#' @export
#' @examples
#' fmt_digits(runif(5, min = 5, max = 15), digits = 1)
#' fmt_digits(runif(5, min = 5, max = 15), digits = 3)
#'
#' fmt_count(sample(10000:99999, size = 5))
#'
#' fmt_corr(runif(5, min = -1, max = 1))
#'
#' fmt_prop(runif(5, min = 0, max = 1))
#'
#' fmt_pct(runif(5, min = 0, max = 100))
#'
#' fmt_prop_pct(runif(5, min = 0, max = 1))
#'
#' @references American Psychological Association. (2020). *Publication manual
#'   of the American Psychological Association* (7th ed.).
#'   \doi{doi:10.1037/0000165-000}
fmt_digits <- function(
  x,
  digits = 1,
  big_mark = ",",
  min_value = -Inf,
  max_value = Inf,
  sub_threshold = 1 / (10^digits),
  keep_boundary = FALSE,
  ...
) {
  to_print <- scales::number(
    x,
    accuracy = 1 / (10^digits),
    big.mark = big_mark,
    style_negative = "minus",
    ...
  )

  if (!is.infinite(min_value)) {
    min_print <- scales::number(
      min_value + sub_threshold,
      accuracy = 1 / (10^digits),
      big.mark = big_mark,
      style_negative = "minus"
    )
    if (keep_boundary) {
      to_print[x < (min_value + sub_threshold) & x != min_value] <- paste0(
        "<",
        min_print
      )
    } else {
      to_print[x < (min_value + sub_threshold)] <- paste0(
        "<",
        min_print
      )
    }
  }

  if (!is.infinite(max_value)) {
    max_print <- scales::number(
      max_value - sub_threshold,
      accuracy = 1 / (10^digits),
      big.mark = big_mark,
      style_negative = "minus"
    )
    if (keep_boundary) {
      to_print[x > (max_value - sub_threshold) & x != max_value] <- paste0(
        ">",
        max_print
      )
    } else {
      to_print[x > (max_value - sub_threshold)] <- paste0(
        ">",
        max_print
      )
    }
  }

  to_print
}

#' @rdname formatting
#' @export
fmt_count <- function(x, ...) {
  for (i in seq_along(x)) {
    check_number_whole(x[i])
  }

  fmt_digits(x, digits = 0, min_value = 0, ...)
}

#' @rdname formatting
#' @export
fmt_corr <- function(x, digits = 3, ...) {
  for (i in seq_along(x)) {
    check_number_decimal(x[i], min = -1, max = 1)
  }

  fmt_digits(
    x,
    digits = digits,
    min_value = -1,
    max_value = 1,
    ...
  ) |>
    stringr::str_replace(stringr::fixed("0."), ".")
}

#' @rdname formatting
#' @export
fmt_prop <- function(x, digits = 2, ...) {
  for (i in seq_along(x)) {
    check_number_decimal(x[i], min = 0, max = 1)
  }

  fmt_digits(
    x,
    digits = digits,
    min_value = 0,
    max_value = 1,
    ...
  ) |>
    stringr::str_replace(stringr::fixed("0."), ".")
}

#' @rdname formatting
#' @export
fmt_pct <- function(x, digits = 0, ...) {
  for (i in seq_along(x)) {
    check_number_decimal(x[i], min = 0, max = 100)
  }

  fmt_digits(
    x,
    digits = digits,
    min_value = 0,
    max_value = 100,
    ...
  )
}

#' @rdname formatting
#' @export
fmt_prop_pct <- function(x, digits = 0, ...) {
  for (i in seq_along(x)) {
    check_number_decimal(x[i], min = 0, max = 1)
  }

  fmt_digits(
    x * 100,
    digits = digits,
    min_value = 0,
    max_value = 100,
    ...
  )
}
