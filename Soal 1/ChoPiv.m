% Faktorisasi Cholesky dengan Pivot
% Kelompok 1 - Kelas B

function [L, p] = ChoPiv(A)
    [n, ~] = size(A);
    L = zeros(n, n);
    p = 1:n;

    for k = 1:n
        % Cari elemen diagonal terbesar untuk pivoting
        [~, v] = max(abs(diag(A(k:n, k:n))));
        v = v + (k - 1);

        % Tukar baris dan kolom v dan k pada A (pivoting)
        if v ~= k
            A([k, v], :) = A([v, k], :);
            A(:, [k, v]) = A(:, [v, k]);
            p([k, v]) = p([v, k]);
            L([k, v], :) = L([v, k], :);
        end

        % Hitung elemen diagonal L
        L(k, k) = sqrt(A(k, k));

        % Hitung elemen-elemen kolom L di bawah diagonal
        L(k+1:n, k) = A(k+1:n, k) / L(k, k);

        % Perbarui submatriks A untuk iterasi berikutnya
        A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - L(k+1:n, k) * L(k+1:n, k)';
    end
end



