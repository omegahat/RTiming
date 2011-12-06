#
# This calculates how expensive it is to have a single 
# routine that can handle integer and numeric vectors by 
# using a cast, or alternatively ensuring the coercion is done
# from numeric to integer and having a simpler C routine.
#
#  int is the baseline with no coercion or casting
#  double is when we don't coerce, but do the casting in the routine that can handle both types
#  change is when we do the coercion and no casting, as it is not needed.

# Results from a Linux machine (tigger)
# The mac is an intel mac with 2 3 GHz Dual Core Intel Xeon chips and 4G 667 Mhz RAM.
#
#

library(RTiming)

times = timeCast(repeats = 1)

library(lattice)
xyplot(time ~ n, times, group = operation, type = "l", subset = timing == "elapsed", auto.key = list(columns = 3))


if(FALSE) {
  load('cast.rda')
  plot(O2times$time, times$time, xlim = range(times$time),  ylim = range(times$time)) 
  abline(coef= c(0, 1))
}

