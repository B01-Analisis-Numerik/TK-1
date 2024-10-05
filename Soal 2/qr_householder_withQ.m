function [Q, R] = qr_householder_withQ(A)
  % QR decomposition using Householder transformation for m x n matrix where m > n
  [m, n] = size(A);  % Get dimensions of A
  Q = eye(m);  % Initialize Q as an identity matrix of size m
  R = A;  % Initialize R as the original matrix

  for k = 1:n
    x = R(k:m, k);  % Take the subvector starting from row k
    e = zeros(length(x), 1);  % Initialize e as a zero vector
    e(1) = norm(x);  % Set the first element of e to be the norm of x
    v = x - e;  % Calculate Householder vector
    v = v / norm(v);  % Normalize v
    H = eye(m);  % Create an identity matrix of size m
    H(k:m, k:m) = eye(length(v)) - 2 * (v * v');  % Apply Householder transformation

    R = H * R;  % Apply transformation to R
    Q = Q * H';  % Update Q by multiplying by the transpose of H
  end
end