function [X, res] = regres_lin_LU(Z, b)
    Z_bias = [ones(size(Z, 1), 1), Z];

    A = Z_bias' * Z_bias;
    B = Z_bias' * b;

    [L, U] = LUFact(A);
    y = ForSubs(L, B);
    X_raw = BackSubs(U, y);

    X = X_raw(2:end, :);
    res = norm(b - (Z*X), 2);
end
