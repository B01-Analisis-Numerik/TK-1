function [L, D, p] = LDLTPiv(A)
    [n, ~] = size(A);
    L = eye(n); % Inisialisasi L sebagai matriks identitas
    D = zeros(n, 1);
    p = 1:n;

    for k = 1:n
        % Pivoting: Cari elemen diagonal terbesar
        [~, v] = max(abs(diag(A(k:n, k:n))));
        v = v + k - 1;

        if v ~= k
            % Tukar baris dan kolom v dan k pada A (pivoting simetris)
            A([k, v], :) = A([v, k], :);
            A(:, [k, v]) = A(:, [v, k]);
            % Tukar elemen pivot
            p([k, v]) = p([v, k]);
            % Tukar baris pada L hingga kolom ke-(k-1)
            if k > 1
                L([k, v], 1:k-1) = L([v, k], 1:k-1);
            end
        end

        % Hitung elemen diagonal D
        D(k) = A(k, k);

        % Hitung elemen-elemen L di bawah diagonal
        if k < n
            L(k+1:n, k) = A(k+1:n, k) / D(k);

            % Perbarui submatriks A untuk iterasi berikutnya
            A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - L(k+1:n, k) * D(k) * L(k+1:n, k)';
        end
    end
end

