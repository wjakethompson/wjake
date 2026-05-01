# Personalized gt theme

A custom theme for tables generated with
[`gt::gt()`](https://gt.rstudio.com/reference/gt.html).

## Usage

``` r
gt_theme_wjake(data, bg_color = "#F0F0F0", font_size = 16, ...)
```

## Arguments

- data:

  The gt table data object.

- bg_color:

  The background color of the table.

- font_size:

  The base font size for the table.

- ...:

  Additional arguments passed to
  [`gt_theme_apa()`](https://wjake.wjakethompson.com/reference/gt_theme_apa.md)
  and
  [`gt::tab_options()`](https://gt.rstudio.com/reference/tab_options.html).

## Value

An object of class `gt_tbl`.
