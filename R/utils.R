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

# Announcement helpers (based on hugodown:::tidy_pleased()) --------------------
announce <- function () {
  phrases <- list(chuffed = c(""),
                  pleased = c("", "most", "very", "extremely", "well"),
                  stoked = c(""),
                  chuffed = c("", "very"),
                  happy = c("", "so", "very", "exceedingly"),
                  thrilled = c(""),
                  delighted = c(""),
                  `tickled pink` = c(""),
                  ecstatic = c(""),
                  elated = c(""),
                  excited = c("", "remarkably"),
                  euphoric = c(""),
                  overjoyed = c(""))
  i <- sample(length(phrases), 1)
  word <- names(phrases)[[i]]
  modifier <- sample(phrases[[i]], 1)
  paste0(modifier, if (modifier != "") " ", word)
}
