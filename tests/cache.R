library(RTiming)
r = seq(20, length = 10, by = 500)

sizes = cbind(expand.grid(r, r), 1:(length(r)^2))
names(sizes) = c("r", "c", "index")

rowUsage = apply(sizes, 1, testPageFaults)
rows = cbind(sizes, rusageListToDataFrame(rowUsage))

save(rows, file = "rows.rda")

colUsage = apply(sizes, 1, testPageFaults, "colLoop")
cols = cbind(sizes, rusageListToDataFrame(colUsage))

save(cols, file = "cols.rda")

save(rows, cols, file = "pageFaults.rda")
