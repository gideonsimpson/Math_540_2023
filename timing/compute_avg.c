#include "compute_avg.h"

/* Compute the average of the function f on the data in x*/
double compute_avg(double *x, int n, double (*f)(double)){

  double avgf = 0.0;
  int i;

  for(i=0;i<n;i++){
    avgf += f(x[i])/n;
  }

  return avgf;
}
