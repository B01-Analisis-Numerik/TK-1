function [] = measure(A)
    tic; % Mulai pengukuran waktu
    [L, U, p] = Pivot(A);
    elapsed_time = toc; % Menghentikan pengukuran waktu
    fprintf('Waktu eksekusi LUfact_pivot: %.6f detik\n', elapsed_time);

    tic; % Mulai pengukuran waktu
    [L, U] = Blockk(A);
    elapsed_time = toc; % Menghentikan pengukuran waktu
    fprintf('Waktu eksekusi LUfact_block: %.6f detik\n', elapsed_time);

    tic; % Mulai pengukuran waktu
    [L, U] = Recursive(A);
    elapsed_time = toc; % Menghentikan pengukuran waktu
    fprintf('Waktu eksekusi LUfact_rec: %.6f detik\n', elapsed_time);
end

