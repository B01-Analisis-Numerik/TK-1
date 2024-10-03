function [X, res] = regres_lin_normal(Z, b)
    % Menambahkan kolom satu untuk bias (intercept) pada Z
    Z_bias = [ones(size(Z, 1), 1), Z];

    % Menghitung theta menggunakan Persamaan Normal
    X_raw = (Z_bias' * Z_bias) \ (Z_bias' * b);
    X = X_raw(2:end, :);

    % Menghitung residual error
    res = norm(b - (Z*X), 2);
end
