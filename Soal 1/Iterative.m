% Faktorisasi LU secara Iteratif
% Kelompok 1 - Kelas B

function [L, U] = Iterative(A)
    % Inisalisasi ukuran matriks A
    [n, ~] = size(A);

    % Inisialisasi L dan U sebagai matriks identitas dan nol
    L = eye(n);
    U = zeros(n);

    for k = 1:n
        % Step 1: Ambil elemen diagonal U
        U(k, k) = A(k, k);

        % Step 2: Ambil baris atas U
        if k < n
            U(k, k+1:n) = A(k, k+1:n);
        end

        % Step 3: Ambil kolom bawah L
        if k < n
            L(k+1:n, k) = A(k+1:n, k) / U(k, k);
        end

        % Step 4: Update submatriks
        for i = k+1:n
            A(i, k+1:n) = A(i, k+1:n) - L(i, k) * U(k, k+1:n);
        end
    end
end

