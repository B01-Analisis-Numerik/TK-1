% Hitung Waktu Eksekusi dan Condition Number untuk setiap kasus uji
% Kelompok 1 - Kelas B

% Ukuran matriks N yang akan diuji
N_values = [16, 64, 128, 256, 512, 1000, 5000, 10000];

% Konfigurasi bandwidth (p, q)
bandwidths = {[1, 1], [2, 1], [3, 4], [N_values(end)/2, N_values(end)/2]};

% Inisialisasi tabel hasil untuk waktu eksekusi dan condition number
results_pivot_time = zeros(length(N_values), length(bandwidths));
results_block_time = zeros(length(N_values), length(bandwidths));
results_recursive_time = zeros(length(N_values), length(bandwidths));

condition_numbers = zeros(length(N_values), length(bandwidths));

% Loop melalui ukuran N
for i = 1:length(N_values)
  N = N_values(i);

  % Loop melalui setiap konfigurasi bandwidth (p, q)
  for j = 1:length(bandwidths)
    pq = bandwidths{j};
    p = pq(1);
    q = pq(2);

    % Generate matriks banded untuk N dan (p, q)
    A = BandMat(N, p, q);

    % Generate vektor b secara acak
    b = rand(N, 1);

    % Hitung condition number sekali untuk tiap (N, p, q)
    kondA = norm(A) * norm(inv(A));
    condition_numbers(i, j) = kondA;

    % --- Faktorisasi Pivot ---
    tic;
    [L_pivot, U_pivot, piv] = Pivot(A);
    exec_time_pivot = toc;

    % Simpan hasil waktu eksekusi untuk LU dengan pivot
    results_pivot_time(i, j) = exec_time_pivot;

    % --- Faktorisasi Block ---
    tic;
    [L_block, U_block] = Block(A);
    exec_time_block = toc;

    % Simpan hasil waktu eksekusi untuk LU Block
    results_block_time(i, j) = exec_time_block;

    % --- Faktorisasi Recursive ---  (Catatan: Matikan saat N > 128)
    tic;
    [L_recursive, U_recursive] = Recursive(A);
    exec_time_recursive = toc;

    % Simpan hasil waktu eksekusi untuk LU Recursive
    results_recursive_time(i, j) = exec_time_recursive;

    % Tampilkan hasil sementara
    fprintf('N = %d, p = %d, q = %d\n', N, p, q);
    fprintf('Pivot Time: %.6f, Block Time: %.6f, Recursive Time: %.6f\n', exec_time_pivot, exec_time_block, exec_time_recursive);
    %fprintf('Pivot Time: %.6f, Block Time: %.6f\n', exec_time_pivot, exec_time_block);
    fprintf('Condition Number: %.6f\n\n', kondA);
  end
end

% Tampilkan hasil waktu eksekusi dalam format tabel
disp('Waktu Eksekusi (dalam detik) Pivot');
disp('N \t (1, 1) \t (2, 1) \t (3, 4) \t (N/2, N/2)');
for i = 1:length(N_values)
  fprintf('%d \t %.6f \t %.6f \t %.6f \t %.6f\n', N_values(i), results_pivot_time(i, 1), results_pivot_time(i, 2), results_pivot_time(i, 3), results_pivot_time(i, 4));
end

% Tampilkan hasil waktu eksekusi dalam format tabel untuk Block
disp('Waktu Eksekusi (dalam detik) Block');
disp('N \t (1, 1) \t (2, 1) \t (3, 4) \t (N/2, N/2)');
for i = 1:length(N_values)
  fprintf('%d \t %.6f \t %.6f \t %.6f \t %.6f\n', N_values(i), results_block_time(i, 1), results_block_time(i, 2), results_block_time(i, 3), results_block_time(i, 4));
end

% Tampilkan hasil waktu eksekusi dalam format tabel untuk Recursive (Catatan: Matikan saat N > 128)
disp('Waktu Eksekusi (dalam detik) Recursive');
disp('N \t (1, 1) \t (2, 1) \t (3, 4) \t (N/2, N/2)');
for i = 1:length(N_values)
  fprintf('%d \t %.6f \t %.6f \t %.6f \t %.6f\n', N_values(i), results_recursive_time(i, 1), results_recursive_time(i, 2), results_recursive_time(i, 3), results_recursive_time(i, 4));
end

% Tampilkan hasil condition number dalam format tabel
disp('Condition Number');
disp('N \t (1, 1) \t (2, 1) \t (3, 4) \t (N/2, N/2)');
for i = 1:length(N_values)
  fprintf('%d \t %.6f \t %.6f \t %.6f \t %.6f\n', N_values(i), condition_numbers(i, 1), condition_numbers(i, 2), condition_numbers(i, 3), condition_numbers(i, 4));
end

