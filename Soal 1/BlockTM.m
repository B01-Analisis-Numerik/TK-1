% Faktorisasi LU dengan Block Khusus Tridiagonal Matriks
% Kelompok 1 - Kelas B

function [L, U] = BlockTM(A)
    % Input: A -> matriks tridiagonal ukuran n x n
    % Output: L, U -> faktor LU dari matriks A
    % Strategi Block LU Factoring khusus untuk matriks tridiagonal

    [n, ~] = size(A); % ukuran matriks
    block_size = 2;   % ukuran blok

    % Inisialisasi matriks L dan U
    L = eye(n);   % Matriks identitas ukuran n x n untuk L
    U = zeros(n); % Matriks nol untuk U

    % Looping untuk memproses blok per blok
    for i = 1:block_size:n
        % Tentukan ukuran blok yang tersisa
        if i + block_size - 1 <= n
            current_block_size = block_size;
        else
            current_block_size = n - i + 1;
        end

        % Submatriks A_ii (blok diagonal utama)
        A_ii = A(i:i+current_block_size-1, i:i+current_block_size-1);

        % Submatriks A_i,i+1 (blok di atas diagonal)
        if i + block_size <= n
            A_i_ip1 = A(i:i+current_block_size-1, i+current_block_size:i+2*block_size-1);
        else
            A_i_ip1 = [];
        end

        % Submatriks A_i+1,i (blok di bawah diagonal)
        if i + block_size <= n
            A_ip1_i = A(i+current_block_size:i+2*block_size-1, i:i+current_block_size-1);
        else
            A_ip1_i = [];
        end

        % Faktorisasi LU dari blok diagonal utama A_ii
        [L_ii, U_ii] = LUFact(A_ii);

        % Simpan hasil faktorisasi di L dan U
        L(i:i+current_block_size-1, i:i+current_block_size-1) = L_ii;
        U(i:i+current_block_size-1, i:i+current_block_size-1) = U_ii;

        % Perhitungan U_i,i+1 (blok di atas diagonal)
        if ~isempty(A_i_ip1)
            U(i:i+current_block_size-1, i+current_block_size:i+2*block_size-1) = L_ii \ A_i_ip1;
        end

        % Perhitungan L_i+1,i (blok di bawah diagonal)
        if ~isempty(A_ip1_i)
            L(i+current_block_size:i+2*block_size-1, i:i+current_block_size-1) = A_ip1_i / U_ii;
        end

        % Schur Complement
        if i + 2*block_size - 1 <= n
            A(i+current_block_size:i+2*block_size-1, i+current_block_size:i+2*block_size-1) = ...
                A(i+current_block_size:i+2*block_size-1, i+current_block_size:i+2*block_size-1) ...
                - L(i+current_block_size:i+2*block_size-1, i:i+current_block_size-1) * ...
                U(i:i+current_block_size-1, i+current_block_size:i+2*block_size-1);
        end
    end
end

