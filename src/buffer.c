#include <Rinternals.h>

SEXP
R_set_numeric_matrix(SEXP matrix, SEXP rows, SEXP cols, SEXP vals)
{
    double *els, *v;
    int i, j, r, c, ctr = 0;

    r = INTEGER(rows)[0];
    c = INTEGER(cols)[0];
    els = REAL(matrix);
    v = REAL(vals);

    for(j = 0; j < c; j++)
	for(i = 0; i < r ; i++, ctr++)
	    els[ctr] = v[ctr];

    return(R_NilValue);
}


SEXP
R_set_numeric_buffer_from_matrix_row(SEXP buf, SEXP matrix, SEXP offset, SEXP len, SEXP stride)
{
    double *els, *v;
    int i;
    int off = INTEGER(offset)[0];
    int n = INTEGER(len)[0];
    int delta = INTEGER(stride)[0];

    els = REAL(buf);
    v = REAL(matrix);

    for(i = 0; i < n; i++, off += delta) {
	els[i] = v[off];
    }

    return(R_NilValue);
}


#include "Rmath.h"
/* 
  Make certain we have initialized the random number generation code,
  e.g. call runif(1) first.
 */
void
R_rnorm(int *n, double *mu, double *sd, double *ans)
{
    int i;
    GetRNGstate();
    for(i = 0; i < *n ; i++) 
	ans[i] = rnorm(*mu, *sd);
    PutRNGstate();
}
