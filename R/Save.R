save =
function (..., list = character(0), file = stop("'file' must be specified"), 
          ascii = FALSE, version = NULL, envir = parent.frame(), compress = !ascii, 
          eval.promises = TRUE, append = FALSE)
{

  if(append) {
    e = new.env(parent = envir)
    load(file, e)

    names <- as.character(substitute(list(...)))[-1]
    list <- c(list, names, objects(e))
    base::save(list = list, file = file, ascii = ascii, version = version, envir = e, compress = compress, eval.promises = eval.promises)
  } else
    base::save(..., list = list, file = file, ascii = ascii, version = version, envir = envir, compress = compress, eval.promises = eval.promises)

}  


toc =
function(file, names.only = FALSE, e = new.env())
{
  load(file, e)
  if(names.only)
    objects(e)
  else {
    data.frame(types = sapply(objects(e), function(id) class(get(id, e))),
               size = sapply(objects(e), function(id) object.size(get(id, e))),
               row.names = objects(e))
  }
}  
