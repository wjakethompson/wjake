# nocov start
.onLoad <- function(libname, pkgname) {
  auto_format <- getOption("wjake.auto_format", default = TRUE)
  if (auto_format) auto_set_format()
}

.onAttach <- function(libname, pkgname) {
  if (getOption("wjake.loadfonts", default = TRUE)) {
    if (!("Source Sans Pro" %in% showtextdb::font_installed())) {
      showtextdb::font_install(showtextdb::google_fonts("Source Sans Pro"))
    }

    font_files <-
      system.file("fonts", "Source Sans Pro",
                  c("regular.ttf", "bold.ttf", "italic.ttf", "bolditalic.ttf"),
                  package = "showtextdb")

    sysfonts::font_add(family = "Source Sans Pro",
                       regular = font_files[1], bold = font_files[2],
                       italic = font_files[3], bolditalic = font_files[4])
  }
}
# nocov end
