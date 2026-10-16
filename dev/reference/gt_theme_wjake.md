# Personalized gt theme

A custom theme for tables generated with
[`gt::gt()`](https://gt.rstudio.com/reference/gt.html).

## Usage

``` r
gt_theme_wjake(
  data,
  font = "Source Sans 3",
  bg_color = "#F0F0F0",
  font_size = 16,
  ...
)
```

## Arguments

- data:

  The gt table data object.

- font:

  The font to use for the table.

- bg_color:

  The background color of the table.

- font_size:

  The base font size for the table.

- ...:

  Additional arguments passed to
  [`gt_theme_apa()`](https://wjake.wjakethompson.com/dev/reference/gt_theme_apa.md)
  and
  [`gt::tab_options()`](https://gt.rstudio.com/reference/tab_options.html).

## Value

An object of class `gt_tbl`.

## Examples

``` r
gt::gt(head(penguins)) |>
  gt_theme_wjake()


  

species
```
