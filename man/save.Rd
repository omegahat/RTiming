\name{save}
\alias{save}
\title{Version of the base::save function that allows us to append to
an existing file }
\description{
This is a trivial extension of the \code{\link[base]{save}}
function which provides an \code{append} argument
to allow the caller to simply add one or more objects
to an existing saved file.
At present, it is not particularly efficient and merely
loads the contents of the original file and then
re-serializes these along with the new objects.
The purpose is to reduce the number of commands
to achieve this effect.
}
\usage{
save(..., list = character(0), file = stop("'file' must be specified"), ascii = FALSE, version = NULL, 
        envir = parent.frame(), compress = !ascii, eval.promises = TRUE, append = FALSE)
}
\arguments{
  \item{\dots}{ see \code{\link[base]{save}}}
  \item{list}{ see \code{\link[base]{save}}}
  \item{file}{  see \code{\link[base]{save}}}
  \item{ascii}{  see \code{\link[base]{save}}}
  \item{version}{ see \code{\link[base]{save}}}
  \item{envir}{ see \code{\link[base]{save}}}
  \item{compress}{ see \code{\link[base]{save}}}
  \item{eval.promises}{ see \code{\link[base]{save}}}
  \item{append}{a logical value indicating whether to add the
     specified objets to the existing file or to overwrite that file
    with just these objects.  This is \code{FALSE} by default to
    preserve the behaviour of the original version, \code{\link[base]{save}}}
}
\details{
  In the future, this could be more intelligent and add to the
  existing file by writing to the end. This may require that the table
  of contents be written at the end of the file so that we can add to
  it without rewriting the entire thing.
}
\value{
 See  \code{\link[base]{save}}.
}
\author{Duncan Temple Lang}

\seealso{ 
 \code{\link[base]{save}}
 \code{\link[base]{load}}
}
\examples{
 x = 1
 a = 1:10

 rda = tempfile()
 save(x, a, file = rda)

 toc(rda)

 b = letters
 z = rnorm(3)
 save(b, z, file = rda, append = TRUE)
 toc(rda)

 unlink(rda)
}

\keyword{IO}
\concept{serialization}
