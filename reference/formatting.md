# Text and Number Formatting

These formatting functions are used to format numerical values in a
consistent manner. This is useful for printing numbers inline with text,
as well as for formatting tables.

## Usage

``` r
fmt_digits(
  x,
  digits = 1,
  big_mark = ",",
  min_value = -Inf,
  max_value = Inf,
  sub_threshold = 1/(10^digits),
  keep_boundary = FALSE,
  ...
)

fmt_count(x, ...)

fmt_corr(x, digits = 3, ...)

fmt_prop(x, digits = 2, ...)

fmt_pct(x, digits = 0, ...)

fmt_prop_pct(x, digits = 0, ...)
```

## Arguments

- x:

  Number to be formatted.

- digits:

  Number of decimal places to retain.

- big_mark:

  Character used between every 3 digits to separate thousands.

- min_value:

  The minimum value `x` can take.

- max_value:

  The maximum value `x` can take.

- sub_threshold:

  The threshold to use when replacing value extremely close to
  `min_value` or `max_value`. By default, this is determined by the
  `digits` specified.

- keep_boundary:

  Whether to preserve true values of boundaries (i.e., `min_value` and
  `max_value`). For example if `digits = 3`, `min_value = 0`, and
  `keep_boundary = FALSE`, a value exactly equal to 0 will become
  "\<.001". If `keep_boundary = TRUE`, then a value of 0 will remain
  "0.000", and other small values (e.g., 0.000001) will continue to be
  replaced with "\<.001".

- ...:

  Additional arguments passed to
  [`scales::number_format()`](https://scales.r-lib.org/reference/comma.html)
  or `fmt_digits()`. See Details for additional information.

## Value

The updated character object of the same length as `x`.

## Details

`fmt_digits()` is a wrapper for
[`scales::number_format()`](https://scales.r-lib.org/reference/comma.html)
and prints a number with the specified number of digits, suppressing
values close to the minimum and maximum values as necessary.

Several helper functions are provided that wrap `fmt_digits()` with
common patterns of `min_value`, `max_value`, and `digits`.

- `fmt_count()` is used for formatting integer values. Prints whole
  numbers with no decimals.

- `fmt_corr()` is used to format correlations or similar indices that
  are bounded between \[-1, 1\]. By default, these values report 3
  decimal places, and the leading 0 is removed as required by APA (2020;
  section 6.36).

- `fmt_prop()` is used to format proportions or similar indices that are
  bounded between \[0, 1\]. Similar to `fmt_corr()`, leading 0s are
  removed. By default, 2 decimal places are reported.

- `fmt_pct()` is used to format percentage values that are bounded \[0,
  100\]. By default, no decimal places are reported.

- `fmt_prop_pct()` formats proportions bounded by \[0, 1\] as
  percentages. That is, we first take `x * 100` and then apply
  `fmt_pct()`.

## References

American Psychological Association. (2020). *Publication manual of the
American Psychological Association* (7th ed.).
[doi:10.1037/0000165-000](https://doi.org/10.1037/0000165-000)

## See also

Other formatters:
[`apa_words()`](https://wjake.wjakethompson.com/reference/apa_words.md)

## Examples

``` r
fmt_digits(runif(5, min = 5, max = 15), digits = 1)
#> [1] "11.0" "6.6"  "5.1"  "9.7"  "10.0"
fmt_digits(runif(5, min = 5, max = 15), digits = 3)
#> [1] "7.898"  "12.329" "12.725" "13.746" "6.749" 

fmt_count(sample(10000:99999, size = 5))
#> [1] "30,996" "22,823" "14,172" "54,458" "88,378"

fmt_corr(runif(5, min = -1, max = 1))
#> [1] ".961"  ".483"  "−.897" ".060"  ".392" 

fmt_prop(runif(5, min = 0, max = 1))
#> [1] ".69" ".03" ".23" ".30" ".64"

fmt_pct(runif(5, min = 0, max = 100))
#> [1] "48" "43" "71" "95" "18"

fmt_prop_pct(runif(5, min = 0, max = 1))
#> [1] "22" "68" "50" "64" "66"
```
