#  Transparency

devtools::load_all('~/Sync/Projects/R/r-lib/rlang')

my_function <- function(x) {
  check_string(x)
}

my_function(1)
#> Error in `my_function()`:
#> ! `x` must be a single string, not a number.
