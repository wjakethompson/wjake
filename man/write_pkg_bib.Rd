% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write-bib.R
\name{write_pkg_bib}
\alias{write_pkg_bib}
\title{Write a bibliography for R packages}
\usage{
write_pkg_bib(pkg, file, update = FALSE)
}
\arguments{
\item{pkg}{A vector of packages to create a \code{.bib} file for.}

\item{file}{The file to save the references.}

\item{update}{Should packages be updated before creating the bibliography?}
}
\value{
A list containing the citations. Citations are also written to the
file as a side effect.
}
\description{
Write a bibliography for R packages
}
