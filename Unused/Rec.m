function [L, U] = Rec(A, p, q, n, offset)
    if nargin < 5
        offset = 0;
    end
    if n == 0
        % Kasus basis: kembalikan L dan U kosong
        L = []; U = [];
        return;
    else
        k = offset + 1;
        N = size(A, 1);
        % Inisialisasi L dan U jika panggilan pertama
        if offset == 0
            L = eye(N);
            U = zeros(N, N);
        end

        % Hitung U(k, k)
        U(k, k) = A(k, k);

        % Hitung U(k, j) untuk pita atas
        for j = k+1 : min(k + q, N)
            U(k, j) = A(k, j);
        end

        % Hitung L(i, k) untuk pita bawah
        for i = k+1 : min(k + p, N)
            L(i, k) = A(i, k) / U(k, k);
        end

        % Perbarui A(i, j) dalam pita
        for i = k+1 : min(k + p, N)
            for j = k+1 : min(k + q, N)
                A(i, j) = A(i, j) - L(i, k) * U(k, j);
            end
        end

        % Panggilan rekursif
        [L, U] = Rec(A, p, q, n - 1, offset + 1);
    end
end

