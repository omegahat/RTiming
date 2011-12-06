named =
function(obj, val = -1)
{
  if(missing(val))
    .Call("R_named", obj)
  else {
    if(! (val %in% 0:2))
      stop("Value for named must be 0, 1 or 2, not ", val)
    .Call("R_setNamed", obj, as.integer(val))
  }
}

"named<-" =
function(x, value)
{
  named(x, value)
  x
}

