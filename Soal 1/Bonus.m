function [L, U] = Bonus(A, p, q)
% Performs LU factorization without pivoting on a banded matrix.
% A: Original matrix
% B: Compressed storage of the banded matrix (size: (p + q + 1) x N)
% p: Lower bandwidth
% q: Upper bandwidth

[N, N] = size(A);

p_size = ((2 * N - p - 1) * p) / 2;
q_size = ((2 * N - p - 1) * q) / 2;
B_size = N + p_size + q_size;

% Compress the matrix A into B
B = zeros(p + q + 1, B_size);
for j = 1:N
    for i = max(1, j - p):min(N, j + q)  % Catatan: Ubah j - q menjadi j - p dan j + p menjadi j + q
        row = p + 1 + i - j;
        if row >= 1 && row <= (p + q + 1) % Memastikan indeks row valid
            B(row, j) = A(i, j);
        end
    end
end

display(B);

for k = 1:N-1
    % Diagonal element A(k, k) is at B(p + 1, k)
    Akk = B(p + 1, k);

    % Check for zero pivot
    if Akk == 0
        error('Zero pivot encountered at row %d', k);
    end

    % Loop over rows within lower bandwidth
    for i = k+1:min(N, k + p)
        % Position in B for A(i, k)
        row_L = p + 1 + i - k;
        L_ik = B(row_L, k) / Akk;
        B(row_L, k) = L_ik;  % Overwrite with L(i, k)

        % Loop over columns within upper bandwidth
        for j = k+1:min(N, k + q)
            % Positions in B
            row_A = p + 1 + i - j;
            row_U = p + 1 + k - j;
            % Check if within bandwidth
            if (row_A > 0 && row_A <= N) && (row_U > 0 && row_U <= N)
                % Update A(i, j)
                B(row_A, j) = B(row_A, j) - L_ik * B(row_U, j);
            end
        end
    end
end

% Initialize L and U
L = eye(N);
U = zeros(N);

for j = 1:N
    for i = max(1, j - p):min(N, j + q)
        row = p + 1 + i - j;
        if row >= 1 && row <= (p + q + 1) % Memastikan indeks row valid
            if i > j
                L(i, j) = B(row, j);
            else
                U(i, j) = B(row, j);
            end
        end
    end
end
end

