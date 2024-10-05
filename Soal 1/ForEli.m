% Forward Elimination
% Kelompok 1 - Kelas B

function x = ForEli(L, b)
    n = length(b);
    x = zeros(n, 1);
    for i = 1:n
        x(i) = (b(i) - L(i, 1:i-1) * x(1:i-1)) / L(i, i);
    end
end

