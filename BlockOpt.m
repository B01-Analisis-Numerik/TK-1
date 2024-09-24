function [L, U] = BlockOpt(A, k)
    n = size(A, 1) / k;  % k adalah ukuran blok (misalnya 2 atau 3)
    L = eye(size(A));
    U = zeros(size(A));

    for i = 1:n
        % Blok utama B_i
        B_i = A((i-1)*k+1:i*k, (i-1)*k+1:i*k);
        if i > 1
            % Koreksi Blok B_i dengan Schur Complement
            D_i_1 = A((i-1)*k+1:i*k, (i-2)*k+1:(i-1)*k);
            B_i = B_i - L((i-1)*k+1:i*k, (i-2)*k+1:(i-1)*k) * U((i-2)*k+1:(i-1)*k, (i-1)*k+1:i*k);
        end

        % Faktorisasi LU dari Blok B_i
        [L_i, U_i] = lu(B_i);
        L((i-1)*k+1:i*k, (i-1)*k+1:i*k) = L_i;
        U((i-1)*k+1:i*k, (i-1)*k+1:i*k) = U_i;

        % Blok C_i (hanya jika bukan blok terakhir)
        if i < n
            C_i = A((i-1)*k+1:i*k, i*k+1:(i+1)*k);
            U((i-1)*k+1:i*k, i*k+1:(i+1)*k) = L_i \ C_i;
        end
    end
end

