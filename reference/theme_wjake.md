# Personalized ggplot2 theme

Based on
[`ggplot2::theme_minimal()`](https://ggplot2.tidyverse.org/reference/ggtheme.html).

## Usage

``` r
theme_wjake(
  base_size = 11.5,
  base_family = "Source Sans Pro",
  header_family = NULL,
  base_line_size = base_size/22,
  base_rect_size = base_size/22,
  ink = "black",
  paper = "white",
  accent = "#FED766",
  continuous = ramp_blue(c(0.1, 1), end = "#FFFFFF"),
  discrete = palette_wjake,
  transparent = FALSE,
  ...
)
```

## Arguments

- base_size:

  base font size, given in pts.

- base_family:

  base font family

- header_family:

  font family for titles and headers. The default, `NULL`, uses theme
  inheritance to set the font. This setting affects axis titles, legend
  titles, the plot title and tag text.

- base_line_size:

  base size for line elements

- base_rect_size:

  base size for rect elements

- ink, paper, accent:

  colour for foreground, background, and accented elements respectively.

- continuous:

  A character vector of valid colors that will be interpolated into a
  continuous color scale.

- discrete:

  A character vector of colors to use for discrete color scales.

- transparent:

  Logical indicator for whether the background of the plot should be
  transparent.

- ...:

  Additional parameters passed to
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html).

## Examples

``` r
if (FALSE) { # \dontrun{
library(ggplot2)

ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
  geom_point(aes(color = species), na.rm = TRUE) +
  labs(
    x = "Bill length (mm)",
    y = "Flipper length (mm)",
    title = "Seminal ggplot2 scatterplot example",
    subtitle = "A plot that is only useful for demonstration purposes",
    caption = "Brought to you by 🐧",
    color = "Species"
  ) +
  theme_wjake()
} # }
```
