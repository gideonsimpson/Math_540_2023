
function assemble_laplace_box_rhs!(B, gN, gS, gE, gW, x, y)
    @. B = 0; # ensure vector is zeroed out
    nx = length(x);
    ny = length(y);
    Δx = x[2] - x[1];
    Δy = y[2] - y[1];
    
    # corners
    
    # (1,1)
    i = 1; j = 1;
    B[i + nx * (j-1)] = 1/Δx^2 * gW(y[j]) + 1/Δy^2 * gS(x[i]);
    # (nx, 1)
    i = nx; j = 1;
    B[i + nx * (j-1)] = 1/Δx^2 * gE(y[j]) + 1/Δy^2 * gS(x[i]);
    # (1, ny)
    i = 1; j = ny;
    B[i + nx * (j-1)] = 1/Δx^2 * gW(y[j]) + 1/Δy^2 * gN(x[i]);
    # (nx, ny)
    i = nx; j = ny;
    B[i + nx * (j-1)] = 1/Δx^2 * gE(y[j]) + 1/Δy^2 * gN(x[i]);


    # edges
    
    # j = 1, south
    j = 1;
    for i in 2:nx-1
        B[i+nx*(j-1)] = 1 / Δy^2 * gS(x[i]);
    end

    # j = ny, north
    j = ny;
    for i in 2:nx-1
        B[i+nx*(j-1)] = 1 / Δy^2 * gS(x[i])
    end

    # i = 1, west
    i = 1;
    for j in 2:ny-1
        B[i+nx*(j-1)] = 1 / Δy^2 * gW(y[j])
    end
    # i = nx, east
    i = nx
    for j in 2:ny-1
        B[i+nx*(j-1)] = 1 / Δy^2 * gE(y[j])
    end

    B
end