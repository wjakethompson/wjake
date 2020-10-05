#' Create an R Markdown PDF Consulting Report
#'
#' This is a function called in the output of the yaml of the Rmd file to
#' specify using the standard consulting report PDF formatting.
#'
#' @param ... Arguments to be passed to `[bookdown::pdf_document2]`
#'
#' @return A modified `pdf_document2` with the standard consulting report
#'   formatting.
#' @export
#'
#' @examples
#' \dontrun{
#'   output: wjake::consulting_report
#' }
consulting_report <- function(...) {
  consulting_template <- find_resource("consulting-report", "template.tex")
  base <- bookdown::pdf_document2(template = consulting_template,
                                  latex_engine = "xelatex",
                                  citation_package = "biblatex",
                                  keep_tex = TRUE, number_sections = FALSE, ...)

  # nolint start
  base$knitr$opts_chunk$comment <- "#>"
  base$knitr$opts_chunk$message <- FALSE
  base$knitr$opts_chunk$warning <- FALSE
  base$knitr$opts_chunk$error <- FALSE
  base$knitr$opts_chunk$echo <- FALSE
  base$knitr$opts_chunk$cache <- FALSE
  base$knitr$opts_chunk$fig.width <- 8
  base$knitr$opts_chunk$fig.asp <- 0.618
  base$knitr$opts_chunk$fig.ext <- "pdf"
  base$knitr$opts_chunk$fig.align <- "center"
  base$knitr$opts_chunk$fig.retina <- 3
  base$knitr$opts_chunk$fig.path <- "figures/"
  base$knitr$opts_chunk$fig.pos <- "H"
  base$knitr$opts_chunk$out.extra <- ""
  base$knitr$opts_chunk$out.width <- "100%"
  base$knitr$opts_chunk$fig.show <- "hold"
  # nolint end

  base$knitr$knit_hooks$plot <- ratlas:::hook_plot_rat

  base
}