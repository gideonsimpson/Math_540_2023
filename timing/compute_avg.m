function avgf = compute_avg(x, f)
    n = length(x);
    
    avgf = 0;
    
    for j=1:n
        avgf = avgf + feval(f, x(j))/n;
    end
    
end