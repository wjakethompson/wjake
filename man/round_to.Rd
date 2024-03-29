% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rounding.R
\name{round_to}
\alias{round_to}
\title{Round to a Specified Value}
\usage{
round_to(x, accuracy, direction = c("nearest", "up", "down", "random"))
}
\arguments{
\item{x}{A numeric value to round.}

\item{accuracy}{The accuracy with which to round (i.e., round to the nearest
\code{accuracy}).}

\item{direction}{The direction to round. \code{nearest} (default) will round to
the nearest \code{accuracy}, \code{up} will round up to the nearest \code{accuracy},
\code{down} will round down to the nearest \code{accuracy}, and \code{random} will
randomly round up or down to the nearest \code{accuracy} as described by
Matthews & Harel (2011).}
}
\value{
A numeric rounded to the specified accuracy.
}
\description{
Round to a Specified Value
}
\examples{
round_to(15, accuracy = 7, direction = "nearest")
round_to(15, accuracy = 7, direction = "up")
round_to(20, accuracy = 7, direction = "down")
}
\references{
Matthews, G., & Harel, O. (2011). Data confidentiality: A review
of methods for statistical disclosure limitation and methods for assessing
privacy. \emph{Statistics Surveys, 5}, 1--29. \doi{10.1214/11-SS074}
}
