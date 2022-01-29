consulting_report_skeleton <- function(path) {
  # copy 'consulting_report_resources' folder to path
  resources <- wjake_file("rstudio", "templates", "project",
                          "consulting_resources")

  sub_dirs <- list.dirs(resources, recursive = TRUE, full.names = FALSE)
  sub_dirs <- sub_dirs[-which(sub_dirs == "")]
  files <- list.files(resources, recursive = TRUE, include.dirs = FALSE)

  # ensure directories exist
  new_path <- c(path, file.path(path, sub_dirs))
  fs::dir_create(new_path)

  source <- file.path(resources, files)
  target <- file.path(path, files)
  file.copy(source, target)

  # copy logos
  fs::dir_create(file.path(path, "figures", "pre-generated"))
  logos_dir <- wjake_file("logos")
  logos <- list.files(logos_dir, recursive = TRUE, include.dirs = FALSE)
  logo_source <- file.path(logos_dir, logos)
  logo_target <- file.path(path, "figures", "pre-generated", logos)
  file.copy(logo_source, logo_target)

  # add book_filename to _bookdown.yml and default to the base path name
  f <- file.path(path, "_bookdown.yml")
  x <- xfun::read_utf8(f)
  xfun::write_utf8(c(sprintf('book_filename: "%s"',
                             paste0(stringr::str_to_title(basename(path)),
                                    "-Estimate")),
                     x,
                     "",
                     "rmd_files: [",
                     paste0('  "estimate.Rmd"'),
                     "]"),
                   f)

  # rename index.Rmd
  fs::file_move(file.path(path, "index.Rmd"),
                file.path(path, "estimate.Rmd"))

  TRUE
}