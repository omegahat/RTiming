if(FALSE) {
dyn.load("cache.so")

# test

r = 20; c = 13
x = matrix(rnorm(r * c), r, c)
ans = numeric(r)

tmp = .C("rowLoop", x, as.integer(r), as.integer(c), ans = ans, DUP = FALSE)$ans
all.equal(rowSums(x), tmp)
# end test


source("~/Books/InterSystemInterfaces/RGCCTU/Rgetrusage.R")
dyn.load("~/Books/InterSystemInterfaces/RGCCTU/Rgetrusage.so")
}


rusageListToDataFrame =
function(d)
{
  slots = getSlots(class(d[[1]]))
  slots = slots[ slots %in% c("numeric", "integer", "logical")]
  
  ans = lapply(names(slots),
                 function(id) {
                   sapply(d, function(x) slot(x, id))
                 })
  names(ans) = names(slots)
  as.data.frame(ans)
}  

testPageFaults =
  function(r, funName = "rowLoop", numReplicates = 1) {
    print(r)
    x = matrix(rnorm(r[1] * r[2]), r[1], r[2])
    ans = numeric(switch(funName, "rowLoop" = r[1], "colLoop" = r[2])) 
    
    rusage(replicate(numReplicates, .C(funName, x, as.integer(r[1]), as.integer(r[2]), ans, DUP = FALSE)))
  }

