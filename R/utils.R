# Helper functions from bookdown and rticles -----------------------------------
find_file <- function(template, file) {
  template <- system.file("rmarkdown", "templates", template, file,
                          package = "wjake")

  if (template == "") {
    stop("Couldn't find template file ", template, "/", file, call. = FALSE)
  }

  template
}

find_resource <- function(template, file) {
  find_file(template, file.path("resources", file))
}

wjake_file <- function(...) {
  system.file(..., package = "wjake", mustWork = TRUE)
}