# Round to a specified value

Round to a specified value

## Usage

``` r
round_to(x, accuracy, direction = c("nearest", "up", "down", "random"))
```

## Arguments

- x:

  A numeric value to round.

- accuracy:

  The accuracy with which to round (i.e., round to the nearest
  `accuracy`).

- direction:

  The direction to round. `nearest` (default) will round to the nearest
  `accuracy`, `up` will round up to the nearest `accuracy`, `down` will
  round down to the nearest `accuracy`, and `random` will randomly round
  up or down to the nearest `accuracy` as described by Matthews & Harel
  (2011).

## Value

A numeric rounded to the specified accuracy.

## References

Matthews, G., & Harel, O. (2011). Data confidentiality: A review of
methods for statistical disclosure limitation and methods for assessing
privacy. *Statistics Surveys, 5*, 1–29.
[doi:10.1214/11-SS074](https://doi.org/10.1214/11-SS074)

## Examples

``` r
round_to(15, accuracy = 7, direction = "nearest")
#> [1] 14
round_to(15, accuracy = 7, direction = "up")
#> [1] 21
round_to(20, accuracy = 7, direction = "down")
#> [1] 14
```
