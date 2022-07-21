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
