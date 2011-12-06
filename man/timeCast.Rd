\name{timeCast}
\alias{timeCast}
\title{Time different approaches to coercion}
\description{
  This function is a simple test for comparing the time
 involved in different approaches to coercion.
 Specifically, we compare three different situations:
 a) where we do no coercion,
 b) where we coerce each element in the C code via a C-level cast
and c) where we coerce the R numeric vector to an integer
and then pass the result to C.
We do this for different sizes of vector and repeat the calculations
several times to obtain stable estimates.
We repeat this within both R and the C routine.

 Not unsurpisingly, a) is fastest, b) is next and c) is slowest.
This allows us to quantify the cost of casting and of 
R-level coercion within this particular setup.

}
\usage{
timeCast(sizes = 10^(0:7), numReplicates = 20, repeats = 5L)
}

\arguments{
  \item{sizes}{a vector giving the sizes of the vectors on which to
  perform the calculations}
  \item{numReplicates}{ the number of times to repeat the call to the
  C-level  routine  for each given vector.}
  \item{repeats}{ the number of times within the C routine to repeat
  the calculation.}
  \item{target}{\dQuote{int} or \dQuote{double} to compare 
    casting to an integer vector or casting to a numeric vector to see
    if there is any difference.}
}
\value{
 A data frame with time, vector size,  the type of test (i.e. direct,
  cast and \dQuote{R coerce} corresponding to scenarios a), b) and c))
and the type of time measured (user, sys, elapsed).
}
\references{
This timing was inspired by a comment by Lee Edlefsen
about the expense of coercion in C and is an attempt to measure this.
And also we are curious about the cost of duplicating/copying
R objects. 
I implemented this approach in one of the internal arithmetic 
routines in R to avoid creating a copy of an integer vector to 
add it element-wise  to a numeric vector.
}
\author{Duncan Temple Lang}
\examples{
times = timeCast(repeats = 1)

library(lattice)
xyplot(time ~ n, times, group = operation, type = "l", subset = timing== "elapsed", auto.key = list(columns = 3))

dtimes = timeCast(repeats = 1, target = "double")
xyplot(time ~ n, dtimes, group = operation, type = "l", subset = timing== "elapsed", auto.key = list(columns = 3))
}
\keyword{programming}
\concept{measurement}
