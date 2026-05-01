# Custom color ramps

These color ramp functions create color scales that can be used for
making ggplot2 plots and gt tables. Color ramps are based on the
[palette_wjake](https://wjake.wjakethompson.com/reference/palette_wjake.md)
color palette.

## Usage

``` r
make_color_pal(colors, bias = 1)

ramp_blue(output, end = "#FFFFFF")

ramp_yellow(output, end = "#FFFFFF")

ramp_yelblu(output, mid = "#F0F0F0")

ramp_orgblu(output, mid = "#999999")
```

## Arguments

- colors:

  colors to interpolate; must be a valid argument to
  [`col2rgb()`](https://rdrr.io/r/grDevices/col2rgb.html).

- bias:

  a positive number. Higher values give more widely spaced colors at the
  high end.

- output:

  Colors to pull from the color ramp. Numbers range from 0-1, which is a
  normalized sliding scale of the color ramp.

- end:

  The end color that the base color should fade into.

- mid:

  For pre-made diverging palettes, the color of the midpoint of the
  scale.

## Value

`make_color_pal()` returns a function that accepts a numeric vector of
values between 0 and 1 and returns a character vector of hex color
codes. `ramp_blue()`, `ramp_yellow()`, `ramp_yelblu()`, and
`ramp_orgblu()` return a character vector of hex color codes.

## Details

`make_color_pal()` can be used to create a color ramp function for any
set of valid colors.

`ramp_blue()`, `ramp_yellow()`, and `ramp_yelblu()` are pre-made color
ramps based on the blue and yellow colors from the
[palette_wjake](https://wjake.wjakethompson.com/reference/palette_wjake.md)
color palette.

`ramp_orgblu()` is a pre-made color ramp based on the first two colors
from the
[palette_okabeito](https://wjake.wjakethompson.com/reference/palette_okabeito.md)
color palette.

## Examples

``` r
new_ramp <- make_color_pal(c("red", "grey", "blue"))
new_ramp(seq(0, 1, length.out = 10))
#>  [1] "#FF0000" "#F02A2A" "#E25454" "#D37E7E" "#C5A8A8" "#A8A8C5" "#7E7ED3"
#>  [8] "#5454E2" "#2A2AF0" "#0000FF"

# Pre-made palettes
ramp_blue(seq(0, 1, by = 0.2))
#> [1] "#FFFFFF" "#CCEBF0" "#99D8E2" "#65C5D3" "#32B2C5" "#009FB7"
ramp_yellow(seq(0.2, 1, length.out = 5))
#> [1] "#FEF7E0" "#FEEFC1" "#FEE7A3" "#FEDF84" "#FED766"
```
