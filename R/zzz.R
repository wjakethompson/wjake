# nocov start
.onLoad <- function(libname, pkgname) {
  auto_format <- getOption("wjake.auto_format", default = TRUE)
  if (auto_format) auto_set_format()
}

.onAttach <- function(libname, pkgname) {
  if (.Platform$OS.type == "windows") {
    if (interactive()) {
      packageStartupMessage("Registering Windows fonts with R")
    }
    extrafont::loadfonts("win", quiet = TRUE)
  }

  if (getOption("wjake.loadfonts", default = FALSE)) {
    if (interactive()) {
      packageStartupMessage("Registering PDF & PostScript fonts with R")
    }
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }

  fnt <- extrafont::fonttable()
  if (!any(grepl("Arial[ ]Narrow", fnt$FamilyName))) {
    msg1 <- glue::glue("NOTE: The Arial Narrow font is required to use these ",
                       "themes.")
    msg2 <- glue::glue("      If Arial Narrow is not on your system, please ",
                       "see https://bit.ly/arialnarrow")
    packageStartupMessage(msg1)
    packageStartupMessage(msg2)
  }
}
# nocov end
