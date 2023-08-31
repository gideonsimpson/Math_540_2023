%% Timing Examples
% time different functions
%% Define function for evaluation
% f = @(x) log(1+x);
% f = @(x) sinc(x);
f = @(x) besselj(0, x);
%% Construct Data
x = linspace(0, 1, 10^6);
%% Time the looping method

avgf_timing = @() compute_avg(x, f);

timeit(avgf_timing)
%% Time the vectorized method
avgfvec_timing = @() mean(f(x));

timeit(avgfvec_timing)
