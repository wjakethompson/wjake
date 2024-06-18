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

  base$knitr$knit_hooks$plot <- ratlas:::hook_tex_plot_rat

  base
}


#' Create an R Markdown PDF Consulting Agreement
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
#'   output: wjake::consulting_agreement
#' }
consulting_agreement <- function(...) {
  agreement_template <- find_resource("consulting-agreement", "template.tex")
  base <- bookdown::pdf_document2(template = agreement_template,
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

  base$knitr$knit_hooks$plot <- ratlas:::hook_tex_plot_rat

  base
}


#' Custom Knit function for RStudio
#'
#' @inheritParams rmarkdown::render
#' @param ... Arguments to pass to [bookdown::render_book]
#'
#' @export
knit_with_contract <- function(input, quiet = FALSE, ...) {
  if (!dir.exists("_report")) dir.create("_report")
  input_yaml <- rmarkdown::yaml_front_matter(input)

  rmarkdown::render(
    "contract/consulting-agreement.Rmd",
    output_format = "wjake::consulting_agreement",
    output_file = "../_report/consulting-agreement.pdf",
    params = list(
      client = list(name = input_yaml$recepient$name,
                    company = input_yaml$recepient$organization,
                    building = input_yaml$recepient$address1,
                    address = input_yaml$recepient$address2,
                    city = input_yaml$recepient$address3,
                    email = input_yaml$recepient$email),
      payment = list(fee = input_yaml$author$fee,
                     hourly = input_yaml$author$hourly,
                     date = input_yaml$author$agree_date,
                     complete = input_yaml$author$complete_date)
    ),
    quiet = quiet, envir = globalenv()
  )

  rmarkdown::render(
    input,
    output_format = "wjake::consulting_report",
    output_file = "_report/consulting-scope.pdf",
    params = list(
      watermark = "Exhibit A"
    ),
    quiet = quiet, envir = globalenv()
  )

  files <- fs::dir_ls("_report", regexp = "\\.pdf") |>
    stringr::str_subset("full-contract", negate = TRUE) |>
    stringr::str_subset("consulting-agreement", negate = TRUE) |>
    stringr::str_sort()

  pdftools::pdf_combine(input = c("_report/consulting-agreement.pdf",
                                  files),
                        output = "_report/full-contract.pdf")
}
