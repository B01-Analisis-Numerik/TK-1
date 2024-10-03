function [R, bt] = qr_householder_woQ_optimized(A, b)
    [m, n] = size(A);
    A = [A, b];

    for j = 1:n
        x = A(j:m, j);
        norm_x = norm(x);
        alpha = -sign(x(1)) * norm_x;
        v = x;
        v(1) = v(1) - alpha;
        beta = 2 / (v' * v);

        % Update the remaining columns using the Householder vector
        A(j:m, j:n+1) = A(j:m, j:n+1) - beta * v * (v' * A(j:m, j:n+1));
    end

    R = A(:, 1:n);
    bt = A(:, n + 1);
end
