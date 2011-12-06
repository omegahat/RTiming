\name{toc}
\alias{toc}
\title{List the elements in a serialized file}
\description{
 This provides a table of contents for a previously
\code{\link[base]{save}}d file.  The idea is that
this provides a simple way to find out what is in
an rda file.  It can return just the names or
alternatively the name and class of each object.

Currently, this loads the entire file but into a
separate environnment. One can specify the environment
and this allows the caller to load the objects
to see what is in the file and then access individual elements
without polluting the global environment.
In the future, we might be able to extract the table
of contents without loading the objects.
}
\usage{
toc(file, names.only = FALSE, e = new.env())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{ the connection or file name in which to find the
  serialized data}
  \item{names.only}{ a logical value indicating whether to return just
  the names of the symbols in the serialized data, or if \code{FALSE}
   to return their types and sizes also.}
  \item{e}{the environment into which the serialized objects should be
  deserialized.  In the future, this may disappear when we can extract
  the information without explicitly loading the objects.}
}
\value{
 Either a character vector giving the names of the variables/symbols
in the serialized data or a
named character vector giving the symbol name and class pairs.
}
\references{ 
 save and load in R's base package.
}
\author{Duncan Temple Lang}
\seealso{ 
 \code{\link{save}}
 \code{\link[base]{save}}
 \code{\link[base]{load}}
}
\examples{
 x = 1
 y = 2
 z = 3

 filename = paste(tempfile(), ".rda", sep = "")
 save(x, y, z, file = filename)
 toc(filename)
}
\keyword{IO}
\concept{serialization}
