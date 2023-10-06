
function assemble_matrix(n, Δx)
    A = zeros(n - 1, n - 1)

    for i = 1:n-1
        # treat the first and last rows seperately
        if i == 1
            A[1, 1] = 2 / Δx^2
            A[1, 2] = -1 / Δx^2
        elseif i == n - 1
            A[n-1, n-2] = -1 / Δx^2
            A[n-1, n-1] = 2 / Δx^2
        else
            A[i, i-1] = -1 / Δx^2
            A[i, i] = 2 / Δx^2
            A[i, i+1] = -1 / Δx^2
        end

    end

    return A
end

using SparseArrays

function assemble_spmatrix(n, Δx)
    # build matrix
    A = spdiagm(0 => -2 * ones(n-1) / Δx^2,
        -1 => ones(n - 2) / Δx^2,
        1 => ones(n - 2) / Δx^2)

    return A
end