# Title

Title

## Usage

``` r
gt_theme_apa(
  data,
  dec_dig = 1,
  corr_dig = 3,
  fmt_extreme = TRUE,
  bg_color = "#FFFFFF",
  font = "Arial",
  font_size = 11,
  ...
)
```

## Arguments

- data:

  The gt table data object.

- dec_dig:

  The number of decimal places to round to for numeric values.

- corr_dig:

  The number of decimal places to round to for numeric values all
  constrained to be between \[-1, 1\].

- fmt_extreme:

  Logical indicator for whether values close to extremes should be
  suppressed (e.g., .000001 becomes \<.001).

- bg_color:

  The background color of the table.

- font:

  The font to use for the table.

- font_size:

  The base font size for the table.

- ...:

  Additional options passed to
  [`gt::tab_options()`](https://gt.rstudio.com/reference/tab_options.html)

## Value

An object of class `gt-tbl`.

## Examples

``` r
gt::gt(head(penguins)) |>
  gt_theme_apa() |>
  gt::fmt_number(year, sep_mark = "", decimals = 0)


  

species
```
