function [L, U] = Bonus1D(A, p, q)
% LU factorization of a banded matrix A using compressed storage
% Inputs:
%   N - size of the matrix
%   p - lower bandwidth
%   q - upper bandwidth
%   A - N x N matrix (full matrix)
% Outputs:
%   L - N x N lower triangular matrix
%   U - N x N upper triangular matrix
[N, N] = size(A)

% Step 1: Compress the matrix A into B
B = zeros(p + q + 1, N);
for i = 1:N
    for j = max(1, i - p):min(N, i + q)
        k = i - j + q + 1;
        B(k, j) = A(i, j);
    end
end

% Step 2: Initialize L and U
L = zeros(N, N);
U = zeros(N, N);

% Step 3: Perform LU factorization using the compressed matrix B
for k = 1:N
    % Compute U(k, k)
    sum = 0;
    s_start = max(1, k - p);
    for s = s_start:k - 1
        sum = sum + L(k, s) * U(s, k);
    end
    U(k, k) = A_comp(k, k, B, p, q) - sum;
    L(k, k) = 1;

    % Compute U(k, j) for j = k + 1 to min(N, k + q)
    j_end = min(N, k + q);
    for j = k + 1:j_end
        sum = 0;
        for s = s_start:k - 1
            sum = sum + L(k, s) * U(s, j);
        end
        U(k, j) = A_comp(k, j, B, p, q) - sum;
    end

    % Compute L(i, k) for i = k + 1 to min(N, k + p)
    i_end = min(N, k + p);
    for i = k + 1:i_end
        sum = 0;
        s_start_L = max(1, k - q);
        for s = s_start_L:k - 1
            sum = sum + L(i, s) * U(s, k);
        end
        L(i, k) = (A_comp(i, k, B, p, q) - sum) / U(k, k);
    end
end
end

% Function to access elements from the compressed matrix B
function val = A_comp(i, j, B, p, q)
k = i - j + q + 1;
if k >= 1 && k <= p + q + 1
    val = B(k, j);
else
    val = 0;
end
end

