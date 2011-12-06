
timeCast =
function(sizes = 10^(0:7), numReplicates = 20, repeats = 5L, target = "int")
{
  repeats = as.integer(repeats)
  
  times =
    lapply(sizes,
           function(n) {
                i = integer(n)
                d = double(n)

                if(target == "int") {
                  int = system.time(replicate(numReplicates, .Call("R_cast", i, repeats, DUP = FALSE)))
                  double = system.time(replicate(numReplicates, .Call("R_cast", d, repeats, DUP = FALSE)))
                  change = system.time(replicate(numReplicates, .Call("R_avoidCast", d, repeats, DUP = FALSE)))
                } else {
                  int = system.time(replicate(numReplicates, .Call("R_double_cast", d, repeats, DUP = FALSE)))
                  double = system.time(replicate(numReplicates, .Call("R_double_cast", i, repeats, DUP = FALSE)))
                  change = system.time(replicate(numReplicates, .Call("R_double_avoidCast", i, repeats, DUP = FALSE)))
                }
                rbind(int, double, change)[,1:3]
          })

   data.frame(time = unlist(times),
              n = rep(sizes, rep(9, length(sizes))),
              operation = factor(rep(c("direct", "cast", "R coerce"), 3*length(sizes))),
              timing = factor(rep(rep(c("user", "sys", "elapsed"), rep(3, 3)), length(sizes))))

}
