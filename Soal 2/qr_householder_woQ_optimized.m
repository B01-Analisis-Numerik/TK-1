function [R, bt] = qr_householder_woQ_optimized(A, b)
    [m, n] = size(A);
    A = [A, b];

    for j = 1:n
        x = A(j:m, j);
        norm_x = norm(x);
        alpha = -sign(x(1)) * norm_x;
        x(1) = x(1) - alpha;
        x = x / norm_x;
        A(j:m, j:n+1) = A(j:m, j:n+1) - 2 * (x * x' * A(j:m, j:n+1));
    end

    R = A(:, 1:n);
    bt = A(:, n + 1);
end
