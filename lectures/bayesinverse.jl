using SparseArrays
using Random
using FFTW
using DataInterpolations


"""
    solve_bvp(a, f, Δx)

Solve -d/dx(a(x)dp/dx) = f, with Dirichlet BCs on (0,1)
"""
function solve_bvp(a, f, Δx)
    A = spdiagm(-1 => -a[2:end-1] / Δx^2,
        0 => (a[1:end-1] + a[2:end]) / Δx^2,
        1 => -a[2:end-1] / Δx^2)
    p = A \ f
    return [0; p; 0]
end


"""
    sample_field(s, σ, N)

Sample a mean zero random field with periodic boundary conditions with
covariance C = σ² (I-d^2/dx^2)^{-s/2} over [0,1).
"""
function sample_field_fft(N)
    uhat = zeros(ComplexF64, 2 * N) # preallocate space

    ξ = randn(N) # generate the random variables

    # construct the eigenvalues
    k = 1:N
    λ = @. 1 /(1 + (π * k)^2);

    # fill in the nonzero entries
    # NOTE we need to multiply by 2 * N for FFT scaling
    @. uhat[2:N+1] = 2 * N * sqrt(λ) * sqrt(2) * ξ

    # invert and get the relevant imaginary part
    u = [0; imag.(ifft(uhat))[N+2:end]; 0];
    return u
end

