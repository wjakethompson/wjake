test_that("rouding works", {
  expect_equal(round_to(15, accuracy = 7,  direction = "nearest"), 14)
  expect_equal(round_to(51, accuracy = 10, direction = "nearest"), 50)
  expect_equal(round_to(25, accuracy = 1,  direction = "nearest"), 25)
  expect_equal(round_to(22, accuracy = 8,  direction = "nearest"), 24)
  expect_equal(round_to(58, accuracy = 2,  direction = "nearest"), 58)

  expect_equal(round_to(66, accuracy = 6, direction = "up"), 66)
  expect_equal(round_to(39, accuracy = 9, direction = "up"), 45)
  expect_equal(round_to(65, accuracy = 1, direction = "up"), 65)
  expect_equal(round_to(45, accuracy = 3, direction = "up"), 45)
  expect_equal(round_to(79, accuracy = 5, direction = "up"), 80)

  expect_equal(round_to(81, accuracy = 3, direction = "down"), 81)
  expect_equal(round_to(59, accuracy = 6, direction = "down"), 54)
  expect_equal(round_to(31, accuracy = 5, direction = "down"), 30)
  expect_equal(round_to(5,  accuracy = 1, direction = "down"), 5)
  expect_equal(round_to(69, accuracy = 7, direction = "down"), 63)

  rand1 <- vapply(rep(17L, 1e4), round_to, double(1), accuracy = 10,
                  direction = "random")
  expect_equal(mean(rand1 == 20), .7, tolerance = 0.01)

  rand2 <- vapply(rep(68L, 1e4), round_to, double(1), accuracy = 3,
                  direction = "random")
  expect_equal(mean(rand2 == 66), .33, tolerance = 0.01)
})
