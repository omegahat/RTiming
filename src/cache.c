
void
rowLoop(double *x, int *rr, int *cc, double *ans)
{
   int i, j;
   int r, c;
   r = *rr;
   c = *cc;
   for(i = 0; i < r; i++) {
       ans[i] = 0;
       for(j = 0; j < c; j++)
	       ans[i] += x[ r*(j)+ i];
   }
}

void
colLoop(double *x, int *rr, int *cc, double *ans)
{
   int i, j;
   int r, c;
   r = *rr;
   c = *cc;

   for(j = 0; j < c; j++) {
       ans[j] = 0;
       for(i = 0; i < r; i++)
	    ans[j] += x[ r*j + i];
   }
}

