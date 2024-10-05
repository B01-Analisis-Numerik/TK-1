function [Q, R] = qr_householder_optimized(A)
    [m, n] = size(A);
    Q = eye(m);
    R = A;

    for k = 1:n
        x = R(k:m, k);
        norm_x = norm(x);
        alpha = -sign(x(1)) * norm_x;
        v = x;
        v(1) = v(1) - alpha;
        v = v / norm(v);
        Q_k = eye(m);
        Q_k(k:m, k:m) = eye(length(v)) - 2 * (v * v');
        R = Q_k * R;
        Q = Q * Q_k;
    end
end