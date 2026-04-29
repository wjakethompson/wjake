# nocov start
.onAttach <- function(libname, pkgname) {
  if (getOption("wjake.loadfonts", default = TRUE)) {
    if (!("Source Sans Pro" %in% showtextdb::font_installed())) {
      showtextdb::font_install(showtextdb::google_fonts("Source Sans Pro"))
    }

    font_files <-
      system.file(
        "fonts",
        "Source Sans Pro",
        c("regular.ttf", "bold.ttf", "italic.ttf", "bolditalic.ttf"),
        package = "showtextdb"
      )

    sysfonts::font_add(
      family = "Source Sans Pro",
      regular = font_files[1],
      bold = font_files[2],
      italic = font_files[3],
      bolditalic = font_files[4]
    )

    if (!"Source Sans Pro" %in% systemfonts::system_fonts()$family) {
      systemfonts::register_font(
        name = "Source Sans Pro",
        plain = font_files[1],
        bold = font_files[2],
        italic = font_files[3],
        bolditalic = font_files[4]
      )
    }
  }
}
# nocov end
