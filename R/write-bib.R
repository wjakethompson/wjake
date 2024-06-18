#' Write a bibliography for R packages
#'
#' @param pkg A vector of packages to create a `.bib` file for.
#' @param file The file to save the references.
#' @param update Should packages be updated before creating the bibliography?
#'
#' @return A list containing the citations. Citations are also written to the
#'   file as a side effect.
#' @export
write_pkg_bib <- function(pkg, file, update = FALSE) {
  if (!fs::file_exists(file)) fs::file_create(file)

  # ensure package is installed
  if (update) {
    pak::pak(pkg, ask = FALSE)
  }

  lapply(pkg, cite_package) |>
    unlist() |>
    xfun::write_utf8(file)
}

cite_package <- function(x) {
  pkg_name <- stringr::str_replace(x, "^.*/", "")
  meta <- utils::packageDescription(pkg_name)
  repo <- meta$Repository

  pkg_cite <- if (is.null(repo) && meta$RemoteType == "github") {
    cite_github_pkg(meta)
  } else if (repo == "CRAN") {
    cite_cran_pkg(meta)
  }

  return(pkg_cite)
}

cite_github_pkg <- function(meta) {
  authors <- pull_package_authors(meta)

  last_commit <- gh::gh(
    glue::glue(
      "/repos/{meta$RemoteUsername}/{meta$RemoteRepo}/commits/{meta$RemoteSha}"
    )
  )
  last_date <- last_commit$commit$author$date |>
    lubridate::ymd_hms() |>
    lubridate::as_date() |>
    lubridate::year()

  url <- if (!is.null(meta$URL)) {
    meta$URL |>
      stringr::str_replace_all("\\n", " ") |>
      stringr::str_split_1(", ") |>
      stringr::str_subset("github")
  } else {
    NULL
  }

  glue::glue(
    "@manual{{R-{meta$Package},",
    "  author = {{{authors}}},",
    "  year = {{{last_date}}},",
    "  title = {{{{{meta$Package}}}: {format_pkg_title(meta$Title)}}},",
    "  version = {{R package version {meta$Version}}},",
    "  type = {{Computer Software}},",
    "  {ifelse(is.null(url),
               glue::glue('note = {{Internal R Package}}'),
               glue::glue('url = {{{url}}}'))}",
    "}}",
    .sep = "\n"
  ) |>
    format_pkg_caps()
}

cite_cran_pkg <- function(meta) {
  authors <- pull_package_authors(meta)
  year <- meta$`Date/Publication` |>
    lubridate::ymd_hms() |>
    lubridate::year()


  glue::glue(
    "@manual{{R-{meta$Package},",
    "  author = {{{authors}}},",
    "  year = {{{year}}},",
    "  title = {{{{{meta$Package}}}: {format_pkg_title(meta$Title)}}},",
    "  version = {{R package version {meta$Version}}},",
    "  type = {{Computer Software}},",
    "  publisher = {{The Comprehensive R Archive Network}},",
    "  doi = {{10.32614/CRAN.package.{meta$Package}}}",
    "}}",
    .sep = "\n"
  ) |>
    format_pkg_caps()
}

pull_package_authors <- function(meta) {
  authors <- meta$Author |>
    stringr::str_split_1(",\\n  ") |>
    stringr::str_subset("\\[aut") |>
    stringr::str_replace_all("\\n", "") |>
    stringr::str_replace_all(" \\[.*$", "") |>
    knitr::combine_words(sep = " and ", oxford_comma = FALSE)

  return(authors)
}

format_pkg_title <- function(x) {
  stringr::str_replace_all(x, "\\n", " ")
}

format_pkg_caps <- function(citation) {
  citation |>
    stringr::str_replace_all("Dynamic Learning Maps",
                             "{Dynamic Learning Maps}") |>
    stringr::str_replace_all("University of Kansas",
                             "{University of Kansas}") |>
    stringr::str_replace_all("ATLAS", "{ATLAS}") |>
    stringr::str_replace_all("Taylor Swift's", "{Taylor Swift's}") |>
    stringr::str_replace_all(" R ", " {R} ") |>
    stringr::str_replace_all("Bayesian", "{Bayesian}") |>
    stringr::str_replace_all("(?<!R-|=)tdcmStan", "{tdcmStan}") |>
    stringr::str_replace_all("(?<!m)Stan", "{Stan}") |>
    stringr::str_replace_all("TDCMs", "{TDCMs}")
}
