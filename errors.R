#  Bullets

library(tidyverse)

starwars |>
  group_by(gender) |>
  mutate(new = height + "foo")
#> Error in `mutate()`:
#> ! Problem while computing `new = height + "foo"`.
#> ℹ The error occurred in group 1: gender = "feminine".
#> Caused by error in `height + "foo"`:
#> ! non-numeric argument to binary operator


starwars[, 1:25]
#> Error in `starwars[, 1:25]`:
#> ! Can't subset columns past the end.
#> ℹ Locations 15, 16, 17, 18, 19, … don't exist.
#> ℹ There are only 14 columns.

var <- "height"
invisible(starwars |> select(var))
#> Note: Using an external vector in selections is ambiguous.
#> ℹ Use `all_of(var)` instead of `var` to silence this message.
#> ℹ See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
#> This message is displayed once per session.


#  Transparency

devtools::load_all('~/Sync/Projects/R/r-lib/rlang')

my_function <- function(x) {
  check_string(x)
}

my_function(1)
#> Error in `my_function()`:
#> ! `x` must be a single string, not a number.


#  Call and arg

my_function <- function(x) {
  check_n_distinct(x, 2)
}

check_n_distinct <- function(x, n, call = rlang::caller_env()) {
  actual <- dplyr::n_distinct(x)

  if (actual != n) {
    cli::cli_abort(
      "Vector must have {n} distinct values, not {actual}.",
      call = call
    )
  }
}

my_function(1:3)
#> Error in `my_function()`:
#> ! Vector must have 2 distinct values, not 3.
#> Run `rlang::last_trace()` to see where the error occurred.

rlang::last_trace()


check_n_distinct <- function(x,
                             n,
                             call = rlang::caller_env(),
                             arg = rlang::caller_arg(x)) {
  actual <- dplyr::n_distinct(x)

  if (actual != n) {
    cli::cli_abort(
      "{.arg {arg}} must have {n} distinct values, not {actual}.",
      call = call,
      arg = arg
    )
  }
}

my_function(1:3)
#> Error in `my_function()`:
#> ! `x` must have 2 distinct values, not 3.
#> Run `rlang::last_trace()` to see where the error occurred.
