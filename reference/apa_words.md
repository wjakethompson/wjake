# Write APA Words

Confused about whether a number should be written out ("five") or use
numerals ("5")? Use this function! Most useful for R Markdown in-text
writing.

## Usage

``` r
apa_words(x, ordinal = FALSE, negative = "negative")
```

## Arguments

- x:

  The number to be printed

- ordinal:

  Do you want the ordinal numbering (e.g., 1st, 6th, etc.)

- negative:

  The word used to indicate a negative number.

## Value

A character string

## See also

Other formatters:
[`formatting`](https://wjake.wjakethompson.com/reference/formatting.md)

## Examples

``` r
apa_words(5)
#> [1] "five"
apa_words(16)
#> [1] "16"
apa_words(6, ordinal = TRUE)
#> [1] "6th"
```
