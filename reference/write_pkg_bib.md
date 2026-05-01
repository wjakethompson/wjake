# Write a bibliography for R packages

Write a bibliography for R packages

## Usage

``` r
write_pkg_bib(pkg, file, update = FALSE)
```

## Arguments

- pkg:

  A vector of packages to create a `.bib` file for.

- file:

  The file to save the references.

- update:

  Should packages be updated before creating the bibliography?

## Value

A list containing the citations. Citations are also written to the file
as a side effect.

## Examples

``` r
if (FALSE) { # \dontrun{
write_pkg_bib(c("ggplot2", "gt"), file = "packages.bib")
} # }
```
