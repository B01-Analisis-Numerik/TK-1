function [L, U] = Compress(A, p, q)
    % Melakukan faktorisasi LU tanpa pivot pada matriks banded yang disimpan
    % dalam array satu dimensi untuk setiap diagonal.
    %
    % D: Cell array berisi array satu dimensi D{d} untuk setiap diagonal
    % p: Lebar pita bawah
    % q: Lebar pita atas
    % A: Matriks banded

    % Ukuran matriks
    [N, N] = size(A);

    % Indeks diagonal dari -p hingga q
    diag_indices = -p:q;
    num_diagonals = length(diag_indices);
    D = cell(1, num_diagonals);

    % Membuat peta dari diagonal ke indeks dalam cell array D
    D_map = containers.Map(num2cell(diag_indices), num2cell(1:num_diagonals));

    % Inisialisasi array diagonal dari matriks A
    for idx = 1:num_diagonals
        d = diag_indices(idx);
        if d >= 0
            length_of_diagonal = N - d;
            D{idx} = zeros(1, length_of_diagonal);
            for k = 1:length_of_diagonal
                i = k;
                j = k + d;
                D{idx}(k) = A(i, j);
            end
        else
            length_of_diagonal = N + d;
            D{idx} = zeros(1, length_of_diagonal);
            for k = 1:length_of_diagonal
                i = k - d;
                j = k;
                D{idx}(k) = A(i, j);
            end
        end
    end

    for k = 1:N-1
        % Elemen pivot A(k, k) ada di D{D_map(0)}(k)
        if isKey(D_map, 0)
            Akk = D{D_map(0)}(k);
        else
            error('Diagonal utama tidak ditemukan pada iterasi %d', k);
        end

        % Periksa pivot nol
        if Akk == 0
            error('Pivot nol pada baris %d', k);
        end

        % Eliminasi pada pita bawah
        for d = 1:min(p, N - k)
            i = k + d;

            if isKey(D_map, -d) && k <= length(D{D_map(-d)})
                % L(i, k) = A(i, k) / A(k, k)
                % A(i, k) ada di D{D_map(-d)}(k)
                % Simpan L(i, k) kembali ke D{D_map(-d)}(k)
                Lik = D{D_map(-d)}(k);
                Lik = Lik / Akk;
                D{D_map(-d)}(k) = Lik;  % Simpan L(i, k)

                % Pembaruan elemen A(i, j)
                for s = 1:min(q, N - k)
                    j = k + s;

                    % Pastikan bahwa diagonal d_j dan d_ij ada di D_map
                    d_j = k - j;
                    if isKey(D_map, d_j) && j <= length(D{D_map(d_j)})
                        Ukj = D{D_map(d_j)}(j);

                        d_ij = i - j;
                        if isKey(D_map, d_ij) && j <= length(D{D_map(d_ij)})
                            % Perbarui A(i, j)
                            idx = j;
                            if idx <= length(D{D_map(d_ij)})
                                D{D_map(d_ij)}(idx) = D{D_map(d_ij)}(idx) - Lik * Ukj;
                            end
                        end
                    end
                end
            end
        end
    end

    % Rekonstruksi L dan U dari D
    L = eye(N);
    U = zeros(N);

    for idx = 1:length(diag_indices)
        d = diag_indices(idx);
        array = D{idx};
        if isempty(array)
            continue;
        end
        if d >= 0
            % Diagonal utama dan atas
            for k = 1:length(array)
                i = k;
                j = k + d;
                U(i, j) = array(k);
            end
        else
            % Diagonal bawah
            for k = 1:length(array)
                i = k - d;
                j = k;
                L(i, j) = array(k);
            end
        end
    end
end

