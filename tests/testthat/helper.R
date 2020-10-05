create_local_project <- function(dir = fs::file_temp(pattern = "testproj"),
                                 env = parent.frame(),
                                 rstudio = FALSE) {
  create_local_thing(dir, env, rstudio, "project")
}

create_local_thing <- function(dir = fs::file_temp(pattern = pattern),
                               env = parent.frame(),
                               rstudio = FALSE,
                               thing = c("package", "project")) {
  thing <- match.arg(thing)
  if (fs::dir_exists(dir)) {
    usethis::ui_stop("Target {usethis::ui_code('dir')} {usethis::ui_path(dir)} already exists.")
  }

  old_project <- proj_get_() # this could be `NULL`, i.e. no active project
  old_wd <- getwd()          # not necessarily same as `old_project`

  withr::defer(
    {
      usethis::ui_done("Deleting temporary project: {usethis::ui_path(dir)}")
      fs::dir_delete(dir)
    },
    envir = env
  )
  usethis::ui_silence(
    switch(
      thing,
      package = create_package(dir, rstudio = rstudio, open = FALSE, check_name = FALSE),
      project = usethis::create_project(dir, rstudio = rstudio, open = FALSE)
    )
  )

  withr::defer(usethis::proj_set(old_project, force = TRUE), envir = env)
  usethis::proj_set(dir)

  withr::defer(
    {
      usethis::ui_done("Restoring original working directory: {usethis::ui_path(old_wd)}")
      setwd(old_wd)
    },
    envir = env
  )
  setwd(dir)

  invisible(dir)
}
