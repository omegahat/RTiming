#include <Rinternals.h>

SEXP
R_cast(SEXP els, SEXP repeats)
{
    int i, val, n, j, numRepeats;
    
    int doCast = TYPEOF(els) == REALSXP;
    n = LENGTH(els);
    numRepeats = asInteger(repeats);
    for(j = 0; j < numRepeats ; j++) {
	for(i = 0; i < n ; i++) {
	    val += doCast ? (int) REAL(els)[i] : INTEGER(els)[i];
	}
    }
    
    return(ScalarInteger(val));
}

SEXP
R_avoidCast(SEXP els, SEXP repeats)
{
    int i, val, n, j;
    int numRepeats = asInteger(repeats);

    if(TYPEOF(els) == REALSXP)
	els = coerceVector(els, INTSXP);

    n = LENGTH(els);
    for(j = 0; j < numRepeats ; j++) {
	for(i = 0; i < n ; i++) 
	    val += INTEGER(els)[i];
    }
    
    return(ScalarInteger(val));
}




SEXP
R_double_cast(SEXP els, SEXP repeats)
{
    int i, val, n, j, numRepeats;
    
    int doCast = TYPEOF(els) == INTSXP;
    n = LENGTH(els);
    numRepeats = asInteger(repeats);
    for(j = 0; j < numRepeats ; j++) {
	for(i = 0; i < n ; i++) {
	    val += doCast ? (double) INTEGER(els)[i] : REAL(els)[i];
	}
    }
    
    return(ScalarReal(val));
}

SEXP
R_double_avoidCast(SEXP els, SEXP repeats)
{
    int i, val, n, j;
    int numRepeats = asInteger(repeats);

    if(TYPEOF(els) == INTSXP)
	els = coerceVector(els, REALSXP);

    n = LENGTH(els);
    for(j = 0; j < numRepeats ; j++) {
	for(i = 0; i < n ; i++) 
	    val += REAL(els)[i];
    }
    
    return(ScalarReal(val));
}
