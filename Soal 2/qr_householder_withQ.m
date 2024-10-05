function [Q, R] = qr_householder_withQ(A)
    [m, n] = size(A);
    Q = eye(m);
    R = A;

    for k = 1:n
        x = R(k:m, k);
        norm_x = norm(x);
        alpha = -sign(x(1)) * norm_x;
        x(1) = x(1) - alpha;
        x = x / norm(x);
        Q_k = eye(m);
        Q_k(k:m, k:m) = eye(length(x)) - 2 * (x * x');
        R = Q_k * R;
        Q = Q * Q_k;
    end
end
