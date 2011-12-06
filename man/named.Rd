\name{named}
\alias{named}
\alias{named<-}
\title{Tools to experiment with the NAMED setting of an R object}
\description{
  THESE ARE INTENDED ONLY FOR EXPERIMENTATION. DON'T MESS WITH THEM IN
  REGULAR COMPUTATIONS.
  
  These functions allow one to access the NAMED setting
  of an R object. Rather than using the R function to query the
  current value, one must call the C routine directly to avoid
  changing the value of NAMED during the call because the object becomes
  bound to the parameter name x.  Setting the value works fine via R
  functions.
}
\usage{
named(obj, val = -1)
named(obj) <- val
}
\arguments{
  \item{obj}{the R object whose NAMED value is to be queried or set.}
  \item{val}{the value to set the NAMED value to}
}
\details{
  
}
\value{
  An integer.
  Setting the value returns the value of NAMED just before changing to
  the specified new value. This allows one to restore the value.
}
\references{R Internals Manual}
\author{Duncan Temple Lang}
\seealso{}
\examples{

 .Call("R_named", 1:10)

 x = 1:10
 .Call("R_named", x)
 y = x
 .Call("R_named", x)

 rm(y)

 .Call("R_setNamed", x, 1L)
 .Call("R_named", x)

  # BAD - gives 2
  named(1:10)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
