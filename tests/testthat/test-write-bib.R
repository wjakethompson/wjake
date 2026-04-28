taylor_meta <- utils::packageDescription("taylor")
wjake_meta <- utils::packageDescription("wjake")

test_that("authors are parsed correctly", {
  expect_equal(
    pull_package_authors(taylor_meta),
    "W. Jake Thompson",
    ignore_attr = TRUE
  )
})

test_that("package title is parsed correctly", {
  expect_equal(
    format_pkg_title(taylor_meta$Title),
    "Lyrics and Song Data for Taylor Swift's Discography",
    ignore_attr = TRUE
  )

  expect_equal(
    format_pkg_title(wjake_meta$Title),
    "Personal R Package for Miscellaneous Themes, Templates, and Functions"
  )
})

test_that("capitalization is preserved", {
  taylor_cite <- cite_package("taylor")
  expect_match(taylor_cite, "\\@manual\\{R-taylor,")
  expect_match(taylor_cite, "author = \\{W. Jake Thompson\\}")
  expect_match(taylor_cite, "year = \\{[0-9]{4}\\}")
  expect_match(taylor_cite, "date = \\{[0-9]{4}-[0-9]{2}-[0-9]{2}\\}")
  expect_match(
    taylor_cite,
    paste0(
      "title = \\{\\{taylor\\}: Lyrics and Song Data for ",
      "\\{Taylor Swift's\\} Discography\\}"
    )
  )
  expect_match(taylor_cite, "version = \\{R package version [0-9\\.]{5}\\}")
  expect_match(taylor_cite, "type = \\{Computer software\\}")
  expect_match(
    taylor_cite,
    "publisher = \\{The Comprehensive \\{R\\} Archive Network\\}"
  )
  expect_match(taylor_cite, "doi = \\{10\\.32614\\/CRAN\\.package\\.taylor\\}")
})

test_that("bib file is written", {
  bib_file <- withr::local_tempfile(fileext = ".bib")
  write_pkg_bib("taylor", file = bib_file)

  expect_true(file.exists(bib_file))
  expect_equal(
    xfun::read_utf8(bib_file),
    stringr::str_split_1(cite_package("taylor"), "\n")
  )
})

test_that("github packages are citeable", {
  skip_on_cran()

  bib_file <- withr::local_tempfile(fileext = ".bib")
  write_pkg_bib("rdcmtemplate", file = bib_file, update = TRUE)

  expect_true(file.exists(bib_file))
  expect_equal(
    xfun::read_utf8(bib_file),
    stringr::str_split_1(cite_package("rdcmtemplate"), "\n")
  )
})
