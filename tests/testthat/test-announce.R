test_that("announce() creates phrases", {
  phrases <- vector(mode = "character", length = 20)
  for (i in seq_along(phrases)) {
    phrases[i] <- announce()
    expect_true(is.character(phrases[i]))
    expect_false(is.na(phrases[i]))
    expect_false(phrases[i] == "")
    expect_true(nchar(phrases[i]) > 0)
  }

  expect_true(length(unique(phrases)) > 1)
})
