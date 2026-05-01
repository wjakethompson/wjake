# Palette color scale

This is a qualitative scale using the color palette used for
https://wjakethompson.com. See
[palette_wjake](https://wjake.wjakethompson.com/reference/palette_wjake.md)
for details.

## Arguments

- palette:

  A character vector of the color palette to use in the scale (e.g.,
  [palette_wjake](https://wjake.wjakethompson.com/reference/palette_wjake.md),
  [palette_okabeito](https://wjake.wjakethompson.com/reference/palette_okabeito.md)).

- order:

  Numeric vector listing the order in which the colors should be used.
  Default is the order of the palette vector.

- darken:

  Relative amount by which the scale should be darkened (for positive
  values) or lightened (for negative values).

- alpha:

  Alpha transparency level of the color. Default is no transparency.

- ...:

  common discrete scale parameters: `name`, `breaks`, `labels`,
  `na.value`, `limits`, `guide`, and `aesthetics`. See
  [ggplot2::discrete_scale](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  for more details.

## Value

A `ScaleDiscrete` object that can be added to a
[`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html).

## Examples

``` r
library(ggplot2)

ggplot(penguins, aes(x = bill_len, y = flipper_len, color = species)) +
  geom_point() +
  scale_color_wjake()
#> Warning: Removed 2 rows containing missing values or values outside the scale
#> range (`geom_point()`).


ggplot(penguins, aes(bill_len, fill = species)) +
  geom_density(alpha = 0.7) +
  scale_fill_okabeito(order = c(1, 2, 5))
#> Warning: Removed 2 rows containing non-finite outside the scale range
#> (`stat_density()`).

```
