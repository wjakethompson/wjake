# Okabe-Ito color palette

Colorblind friendly palette taken originally described by Okabe and Ito
(2008). The original palette has been modified slightly to make the
yellow more visible on a white background, as described by Lüdecke et
al. (2021). The palette also includes color scales that can be used in
place of
[`ggplot2::scale_color_discrete()`](https://ggplot2.tidyverse.org/reference/scale_colour_discrete.html)
or
[`ggplot2::scale_fill_discrete()`](https://ggplot2.tidyverse.org/reference/scale_colour_discrete.html).

## Usage

``` r
palette_okabeito
```

## Format

A character vector of 8 hex color codes.

## References

Lüdecke, D., Patil, I., Ben-Shachar, M. S., Wiernik, B. M., Waggoner,
P., & Makowski, D. (2021). see: An R package for visualizing statistical
models. *Journal of Open Source Software, 6*(64), Article 3393.
[doi:10.21105/joss.03393](https://doi.org/10.21105/joss.03393)

Okabe, M., & Ito, K. (2008). Color universal design (CUD): How to make
figures and presentations that are friendly to colorblind people.
<https://jfly.uni-koeln.de/color/#pallet> (Original work published 2002)

## Examples

``` r
scales::show_col(palette_okabeito)
```
