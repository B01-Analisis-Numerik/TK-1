function [x, res] = regres_lin_withQ(Q, R, b)
    [m, n] = size(R);
    bt = Q' * b;

    % Backward substitution to solve Rx = bt
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (bt(i) - R(i, i+1:n) * x(i+1:n)) / R(i, i);
    end

    % Calculate residual
    res = norm(bt(n+1:m));
end
