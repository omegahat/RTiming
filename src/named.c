#include <Rinternals.h>
#include <Rdefines.h>

SEXP
R_named(SEXP obj)
{
    SEXP ans;
    int val;
    val = NAMED(obj);
    ans = ScalarInteger(val);
    return(ans); 
}

SEXP
R_setNamed(SEXP obj, SEXP val)
{
    SEXP ans  = ScalarInteger(NAMED(obj));
    int n = asInteger(val);
    SET_NAMED(obj, n);
    return(ans); 
}

