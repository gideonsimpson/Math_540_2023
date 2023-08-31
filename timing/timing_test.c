#include <stdio.h>
#include <math.h> /* needed for math functions */
#include <stdlib.h> /* needed for atoi and atof */
#include <time.h> /* needed for timing */
#include <gsl/gsl_sf.h>
#include "compute_avg.h"

double f_log(double x){
  return log(1+x);
}

int main(int argc, char *argv[]){

   int n;
   int i;
   double *x;
   double A;
   double time_spent;

   /* get problem size at run time */
   n = atoi(argv[1]);

   /* allocate memory */
   x = calloc(n, sizeof(double));

   /* populate the  x array */
   for(i=0;i<n;i++){
      x[i] = i * 1.0/n;
   }
   /* time the computation */
   clock_t begin = clock();
   A = compute_avg(x,n, f_log);
   // A = compute_avg(x,n, gsl_sf_bessel_J0);
   // A = compute_avg(x,n, gsl_sf_sinc);
   clock_t end = clock();

   time_spent = (double)(end-begin)/CLOCKS_PER_SEC;
   printf("Computed A = %g\n",A);
   printf("Run time with n = %d: %g\n",n, time_spent);

   /* free memory */
   free(x);
   return 0;
}
