function [L, U] = Bonus(A, p, q)
% LU factorization of a banded matrix A using separate diagonal arrays
% Inputs:
%   A - N x N banded matrix
%   p - lower bandwidth
%   q - upper bandwidth
% Outputs:
%   L - N x N lower triangular matrix
%   U - N x N upper triangular matrix

N = size(A, 1);

% Step 1: Compress the matrix A into separate diagonal arrays D_k
num_diagonals = p + q + 1;
D = cell(num_diagonals, 1); % Cell array to hold the diagonals

for k = -p:q
    diag_index = k + p + 1; % Index from 1 to num_diagonals
    if k >= 0
        len = N - k;
        D{diag_index} = zeros(len, 1);
        for i = 1:len
            D{diag_index}(i) = A(i, i + k);
        end
    else % k < 0
        len = N + k; % Since k is negative, N + k < N
        D{diag_index} = zeros(len, 1);
        for i = 1:len
            D{diag_index}(i) = A(i - k, i);
        end
    end
end

% Step 2: Initialize L and U
L = zeros(N, N);
U = zeros(N, N);

% Step 3: Perform LU factorization using the diagonal arrays
for k = 1:N
    % Compute U(k, j) for j = k to min(N, k + q)
    for j = k:min(N, k + q)
        sum = 0;
        for s = max(1, k - p):k - 1
            sum = sum + L(k, s) * U(s, j);
        end
        U(k, j) = A_comp(k, j, D, p, q) - sum;
    end
    L(k, k) = 1;

    % Compute L(i, k) for i = k + 1 to min(N, k + p)
    for i = k + 1:min(N, k + p)
        sum = 0;
        for s = max(1, k - p):k - 1
            sum = sum + L(i, s) * U(s, k);
        end
        L(i, k) = (A_comp(i, k, D, p, q) - sum) / U(k, k);
    end
end
end

% Function to access elements from the diagonal arrays D
function val = A_comp(i, j, D, p, q)
k = j - i;
diag_index = k + p + 1; % Index in D
if k >= -p && k <= q
    if k >= 0
        s = i;
        len = length(D{diag_index});
        if s >= 1 && s <= len
            val = D{diag_index}(s);
        else
            val = 0;
        end
    else % k < 0
        s = i + k;
        len = length(D{diag_index});
        if s >= 1 && s <= len
            val = D{diag_index}(s);
        else
            val = 0;
        end
    end
else
    val = 0;
end
end

