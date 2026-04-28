test_that("fmt_digits() uses the correct number of decimals", {
  rand <- runif(n = 10, 0, 100)
  expect_equal(fmt_digits(rand, digits = 2), sprintf("%0.2f", rand))
  expect_equal(fmt_digits(rand, digits = 4), sprintf("%0.4f", rand))
})

test_that("fmt_digits() correctly inserts commas", {
  rand <- runif(n = 100, 100, 1000000)
  expect_equal(
    fmt_digits(rand, digits = 2),
    formatC(rand, digits = 2, big.mark = ",", format = "f")
  )
  expect_equal(
    fmt_digits(rand, digits = 1),
    formatC(rand, digits = 1, big.mark = ",", format = "f")
  )
})

test_that("fmt_digits() acknowledges minimum and maximum values", {
  rand <- c(0, 0.01, 0.1, sort(runif(14, min = .1, max = .9)), 0.9, 0.99, 1)
  expect_equal(
    fmt_digits(rand, digits = 2, min_value = 0, max_value = 1),
    c("<0.01", sprintf("%0.2f", rand[2:19]), ">0.99")
  )
  expect_equal(
    fmt_digits(rand, digits = 1, min_value = 0, max_value = 1),
    c("<0.1", "<0.1", sprintf("%0.1f", rand[3:18]), ">0.9", ">0.9")
  )
})

test_that("fmt_digits() can use a different threshold for subbing", {
  rand <- c(
    runif(5, min = 0, max = 5),
    runif(10, min = 5, max = 15),
    runif(5, min = 15, max = 20)
  )
  expect_equal(
    fmt_digits(rand, digits = 1, min_value = 0, sub_threshold = 5),
    c(rep("<5.0", 5), sprintf("%0.1f", rand[6:20]))
  )
  expect_equal(
    fmt_digits(rand, digits = 1, max_value = 20, sub_threshold = 5),
    c(sprintf("%0.1f", rand[1:15]), rep(">15.0", 5))
  )
  expect_equal(
    fmt_digits(
      rand,
      digits = 1,
      min_value = 0,
      max_value = 20,
      sub_threshold = 5
    ),
    c(rep("<5.0", 5), sprintf("%0.1f", rand[6:15]), rep(">15.0", 5))
  )
})

test_that("fmt_digits() can keep boundaries if needed", {
  rand <- c(
    0,
    runif(4, min = 0, max = 5),
    runif(10, min = 5, max = 15),
    runif(4, min = 15, max = 20),
    20
  )
  expect_equal(
    fmt_digits(
      rand,
      digits = 1,
      min_value = 0,
      sub_threshold = 5,
      keep_boundary = TRUE
    ),
    c("0.0", rep("<5.0", 4), sprintf("%0.1f", rand[6:20]))
  )
  expect_equal(
    fmt_digits(
      rand,
      digits = 1,
      max_value = 20,
      sub_threshold = 5,
      keep_boundary = TRUE
    ),
    c(sprintf("%0.1f", rand[1:15]), rep(">15.0", 4), "20.0")
  )
  expect_equal(
    fmt_digits(
      rand,
      digits = 1,
      min_value = 0,
      max_value = 20,
      sub_threshold = 5,
      keep_boundary = TRUE
    ),
    c(
      "0.0",
      rep("<5.0", 4),
      sprintf("%0.1f", rand[6:15]),
      rep(">15.0", 4),
      "20.0"
    )
  )
})

test_that("fmt_count() adds comma and has no decimals", {
  rand <- sample(0:1000000, size = 100000)
  expect_equal(
    fmt_count(rand),
    formatC(rand, digits = 0, big.mark = ",", format = "f")
  )
})

test_that("fmt_count() can suppress small values", {
  rand <- seq(0, 10000, by = 100)
  expect_equal(
    fmt_count(rand, sub_threshold = 900),
    c(
      rep("<900", 9),
      formatC(rand[10:101], digits = 0, big.mark = ",", format = "f")
    )
  )
})

test_that("fmt_corr() has correct digits and removes leading 0", {
  rand <- sort(runif(50, min = -1, max = 1))
  expect_equal(
    fmt_corr(rand),
    stringr::str_replace(sprintf("%0.3f", rand), "0\\.", ".") |>
      stringr::str_replace("-", "\U2212")
  )
  expect_equal(
    fmt_corr(rand, digits = 2),
    stringr::str_replace(sprintf("%0.2f", rand), "0\\.", ".") |>
      stringr::str_replace("-", "\U2212")
  )
})

test_that("fmt_corr() respects boundaries and thresholds", {
  rand <- c(-1, -.999, -.99, -.9, sort(runif(12, -.9, .9)), .9, .99, .999, 1)

  rand3 <- stringr::str_replace(sprintf("%0.3f", rand), "0\\.", ".") |>
    stringr::str_replace("-", "\U2212")
  expect_equal(
    fmt_corr(rand, digits = 3),
    c("<-.999", rand3[2:19], ">.999") |>
      stringr::str_replace("-", "\U2212")
  )
  expect_equal(
    fmt_corr(rand, digits = 3, keep_boundary = TRUE),
    c("-1.000", rand3[2:19], "1.000") |>
      stringr::str_replace("-", "\U2212")
  )
  expect_equal(
    fmt_corr(rand, digits = 3, sub_threshold = .1),
    c(rep("<-.900", 3), rand3[4:17], rep(">.900", 3)) |>
      stringr::str_replace("-", "\U2212")
  )

  rand2 <- stringr::str_replace(sprintf("%0.2f", rand), "0\\.", ".") |>
    stringr::str_replace("-", "\U2212")
  expect_equal(
    fmt_corr(rand, digits = 2),
    c("<-.99", "<-.99", rand2[3:18], ">.99", ">.99") |>
      stringr::str_replace("-", "\U2212")
  )
  expect_equal(
    fmt_corr(rand, digits = 2, keep_boundary = TRUE),
    c("-1.00", "<-.99", rand2[3:18], ">.99", "1.00") |>
      stringr::str_replace("-", "\U2212")
  )
})

test_that("fmt_prop() has correct digits and removes leading 0", {
  rand <- sort(runif(50, min = 0.1, max = 0.9))
  expect_equal(
    fmt_prop(rand),
    stringr::str_replace(sprintf("%0.2f", rand), "0\\.", ".")
  )
  expect_equal(
    fmt_prop(rand, digits = 3),
    stringr::str_replace(sprintf("%0.3f", rand), "0\\.", ".")
  )
})

test_that("fmt_prop() respects boundaries and thresholds", {
  rand <- c(0, 0.001, 0.01, 0.1, runif(12, .1, .9), 0.9, 0.99, 0.999, 1)
  expect_equal(
    fmt_prop(rand, digits = 3),
    c(
      rep("<.001", 1),
      stringr::str_replace(sprintf("%0.3f", rand[2:19]), "0\\.", "."),
      rep(">.999", 1)
    )
  )
  expect_equal(
    fmt_prop(rand, digits = 3, keep_boundary = TRUE),
    c(
      rep(".000", 1),
      stringr::str_replace(sprintf("%0.3f", rand[2:19]), "0\\.", "."),
      rep("1.000", 1)
    )
  )
  expect_equal(
    fmt_prop(rand, digits = 3, sub_threshold = .1, keep_boundary = TRUE),
    c(
      ".000",
      "<.100",
      "<.100",
      stringr::str_replace(sprintf("%0.3f", rand[4:17]), "0\\.", "."),
      ">.900",
      ">.900",
      "1.000"
    )
  )

  expect_equal(
    fmt_prop(rand),
    c(
      rep("<.01", 2),
      stringr::str_replace(sprintf("%0.2f", rand[3:18]), "0\\.", "."),
      rep(">.99", 2)
    )
  )
  expect_equal(
    fmt_prop(rand, keep_boundary = TRUE),
    c(
      ".00",
      "<.01",
      stringr::str_replace(sprintf("%0.2f", rand[3:18]), "0\\.", "."),
      ">.99",
      "1.00"
    )
  )
  expect_equal(
    fmt_prop(rand, sub_threshold = .1, keep_boundary = FALSE),
    c(
      "<.10",
      "<.10",
      "<.10",
      stringr::str_replace(sprintf("%0.2f", rand[4:17]), "0\\.", "."),
      ">.90",
      ">.90",
      ">.90"
    )
  )
})

test_that("fmt_pct() has correct digits", {
  rand <- sort(runif(50, min = 1, max = 99))
  expect_equal(fmt_pct(rand), sprintf("%0.0f", rand))
  expect_equal(fmt_pct(rand, digits = 2), sprintf("%0.2f", rand))
})

test_that("fmt_pct() respects boundaries and thresholds", {
  rand <- c(0, 0.01, 0.1, 1, sort(runif(42, 1, 99)), 99, 99.9, 99.99, 100)
  expect_equal(
    fmt_pct(rand),
    c(rep("<1", 3), sprintf("%0.0f", rand[4:47]), rep(">99", 3))
  )
  expect_equal(
    fmt_pct(rand, keep_boundary = TRUE),
    c("0", rep("<1", 2), sprintf("%0.0f", rand[4:47]), rep(">99", 2), "100")
  )

  expect_equal(
    fmt_pct(rand, digits = 1),
    c(rep("<0.1", 2), sprintf("%0.1f", rand[3:48]), rep(">99.9", 2))
  )
  expect_equal(
    fmt_pct(rand, digits = 1, keep_boundary = TRUE),
    c("0.0", "<0.1", sprintf("%0.1f", rand[3:48]), ">99.9", "100.0")
  )
  expect_equal(
    fmt_pct(rand, digits = 1, sub_threshold = 1),
    c(rep("<1.0", 3), sprintf("%0.1f", rand[4:47]), rep(">99.0", 3))
  )
})

test_that("fmt_prop_pct() has correct digits", {
  rand <- sort(runif(50, min = 0.01, max = 0.99))
  expect_equal(fmt_prop_pct(rand), sprintf("%0.0f", rand * 100))
  expect_equal(fmt_prop_pct(rand, digits = 2), sprintf("%0.2f", rand * 100))
})

test_that("fmt_prop_pct() respects boundaries and thresholds", {
  rand <- c(
    0,
    0.0001,
    0.001,
    0.01,
    sort(runif(42, 0.01, 0.99)),
    0.99,
    0.999,
    0.9999,
    1
  )
  expect_equal(
    fmt_prop_pct(rand),
    c(rep("<1", 3), sprintf("%0.0f", rand[4:47] * 100), rep(">99", 3))
  )
  expect_equal(
    fmt_prop_pct(rand, keep_boundary = TRUE),
    c(
      "0",
      rep("<1", 2),
      sprintf("%0.0f", rand[4:47] * 100),
      rep(">99", 2),
      "100"
    )
  )

  expect_equal(
    fmt_prop_pct(rand, digits = 1),
    c(rep("<0.1", 2), sprintf("%0.1f", rand[3:48] * 100), rep(">99.9", 2))
  )
  expect_equal(
    fmt_prop_pct(rand, digits = 1, keep_boundary = TRUE),
    c("0.0", "<0.1", sprintf("%0.1f", rand[3:48] * 100), ">99.9", "100.0")
  )
  expect_equal(
    fmt_prop_pct(rand, digits = 1, sub_threshold = 1),
    c(rep("<1.0", 3), sprintf("%0.1f", rand[4:47] * 100), rep(">99.0", 3))
  )
})
