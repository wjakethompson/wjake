# X & Y scales for percent and comma labels

Wrappers around
[`ggplot2::continuous_scale()`](https://ggplot2.tidyverse.org/reference/continuous_scale.html)
that provide automatic percent or comma formatting.

## Usage

``` r
scale_x_comma(...)

scale_y_comma(...)

scale_x_percent(...)

scale_y_percent(...)
```

## Arguments

- ...:

  Additional arguments passed to
  [`ggplot2::scale_x_continuous()`](https://ggplot2.tidyverse.org/reference/scale_continuous.html)
  or
  [`ggplot2::scale_y_continuous()`](https://ggplot2.tidyverse.org/reference/scale_continuous.html).

## Value

A ggplot2 continuous scale.

## Examples

``` r
library(ggplot2)
set.seed(1234)

ggplot() +
  geom_point(aes(x = sample(1000:9999, size = 100), y = runif(100, 0, 1))) +
  scale_x_comma() +
  scale_y_percent(breaks = seq(0, 1, by = .2))
```
