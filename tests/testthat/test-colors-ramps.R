test_that("make_color_pal() produces a function", {
  expect_true(is.function(make_color_pal(c("red", "blue"))))

  func <- make_color_pal(c("orange", "grey", "green"))
  expect_true(is.function(func))
  expect_equal(formalArgs(func), "x")
})

test_that("prebuilt ramps work", {
  # blue -----
  expect_equal(ramp_blue(c(0, 1)), c("#FFFFFF", "#009FB7"))
  expect_equal(
    ramp_blue(seq(0, 1, by = .2)),
    c("#FFFFFF", "#CCEBF0", "#99D8E2", "#65C5D3", "#32B2C5", "#009FB7")
  )
  expect_equal(
    ramp_blue(seq(.2, 1, by = .2)),
    c("#CCEBF0", "#99D8E2", "#65C5D3", "#32B2C5", "#009FB7")
  )
  expect_equal(
    ramp_blue(seq(0, 1, length.out = 10), end = "#009FB7"),
    rep("#009FB7", 10)
  )

  # yellow -----
  expect_equal(ramp_yellow(c(0, 1)), c("#FFFFFF", "#FED766"))
  expect_equal(
    ramp_yellow(seq(0, 1, by = .2)),
    c("#FFFFFF", "#FEF7E0", "#FEEFC1", "#FEE7A3", "#FEDF84", "#FED766")
  )
  expect_equal(
    ramp_yellow(seq(.2, 1, by = .2)),
    c("#FEF7E0", "#FEEFC1", "#FEE7A3", "#FEDF84", "#FED766")
  )
  expect_equal(
    ramp_yellow(seq(0, 1, length.out = 10), end = "#FED766"),
    rep("#FED766", 10)
  )

  # yellow-blue -----
  expect_equal(ramp_yelblu(c(0, 1)), c("#FED766", "#009FB7"))
  expect_equal(ramp_yelblu(c(0, 0.5, 1)), c("#FED766", "#F0F0F0", "#009FB7"))
  expect_equal(
    ramp_yelblu(seq(0, 1, by = 0.25)),
    c("#FED766", "#F7E3AB", "#F0F0F0", "#78C7D3", "#009FB7")
  )
  expect_equal(
    ramp_yelblu(seq(0.25, 1, by = 0.25)),
    c("#F7E3AB", "#F0F0F0", "#78C7D3", "#009FB7")
  )
  expect_equal(
    ramp_yelblu(seq(0.25, 0.75, by = 0.25)),
    c("#F7E3AB", "#F0F0F0", "#78C7D3")
  )

  # orange-blue -----
  expect_equal(ramp_orgblu(c(0, 1)), c("#E69F00", "#56B4E9"))
  expect_equal(ramp_orgblu(c(0, 0.5, 1)), c("#E69F00", "#999999", "#56B4E9"))
  expect_equal(
    ramp_orgblu(seq(0, 1, by = 0.25)),
    c("#E69F00", "#BF9C4C", "#999999", "#77A6C1", "#56B4E9")
  )
  expect_equal(
    ramp_orgblu(seq(0.25, 1, by = 0.25)),
    c("#BF9C4C", "#999999", "#77A6C1", "#56B4E9")
  )
  expect_equal(
    ramp_orgblu(seq(0.25, 0.75, by = 0.25), mid = "white"),
    c("#F2CF7F", "#FFFFFF", "#AAD9F3")
  )
})
