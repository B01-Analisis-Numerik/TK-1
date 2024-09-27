% Hitung Waktu Eksekusi dan Condition Number untuk setiap kasus uji
% Kelompok 1 - Kelas B

% Ukuran matriks N yang akan diuji
N_values = [16, 64, 128, 256, 512, 1000];

% Konfigurasi bandwidth (p, q)
bandwidths = {[1, 1], [2, 1], [3, 4], [N_values(end)/4, N_values(end)/4], [N_values(end)/2, N_values(end)/2]};

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

    % --- Faktorisasi dan Penyelesaian SPL dengan Pivot ---
    tic;
    [L_pivot, U_pivot, piv] = Pivot(A);  % Faktorisasi LU dengan Pivot
    y_pivot = BackSubs(L_pivot, b);      % Backward substitution untuk y
    x_pivot = BackSubs(U_pivot, y_pivot); % Backward substitution untuk x
    exec_time_pivot = toc;

    % Simpan hasil waktu eksekusi untuk LU Pivot
    results_pivot_time(i, j) = exec_time_pivot;

    % --- Faktorisasi dan Penyelesaian SPL dengan Block ---
    tic;
    [L_block, U_block] = Block(A);       % Faktorisasi LU Block
    y_block = BackSubs(L_block, b);      % Backward substitution untuk y
    x_block = BackSubs(U_block, y_block); % Backward substitution untuk x
    exec_time_block = toc;

    % Simpan hasil waktu eksekusi untuk LU Block
    results_block_time(i, j) = exec_time_block;

    % --- Faktorisasi dan Penyelesaian SPL dengan Recursive ---
    if N <= 128  % Batasi Recursive untuk N <= 128
      tic;
      [L_recursive, U_recursive] = Recursive(A);  % Faktorisasi LU Recursive
      y_recursive = BackSubs(L_recursive, b);            % Backward substitution untuk y
      x_recursive = BackSubs(U_recursive, y_recursive);  % Backward substitution untuk x
      exec_time_recursive = toc;
    else
      exec_time_recursive = NaN;  % Jika N > 128, set sebagai NaN
    end

    % Simpan hasil waktu eksekusi untuk LU Recursive
    results_recursive_time(i, j) = exec_time_recursive;

    % Tampilkan hasil sementara
    fprintf('N = %d, p = %d, q = %d\n', N, p, q);
    fprintf('Pivot Time: %.6f, Block Time: %.6f, Recursive Time: %.6f\n', exec_time_pivot, exec_time_block, exec_time_recursive);
    fprintf('Condition Number: %.6f\n\n', kondA);
  end
end

% Tampilkan hasil waktu eksekusi dalam format tabel
disp('Waktu Eksekusi (dalam detik) Pivot');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), results_pivot_time(i, 1), results_pivot_time(i, 2), results_pivot_time(i, 3), results_pivot_time(i, 4), results_pivot_time(i, 5));
end

% Tampilkan hasil waktu eksekusi dalam format tabel untuk Block
disp('Waktu Eksekusi (dalam detik) Block');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), results_block_time(i, 1), results_block_time(i, 2), results_block_time(i, 3), results_block_time(i, 4), results_block_time(i, 5));
end

% Tampilkan hasil waktu eksekusi dalam format tabel untuk Recursive (Catatan: Matikan saat N > 128)
disp('Waktu Eksekusi (dalam detik) Recursive');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), results_recursive_time(i, 1), results_recursive_time(i, 2), results_recursive_time(i, 3), results_recursive_time(i, 4), results_recursive_time(i, 5));
end

% Tampilkan hasil condition number dalam format tabel
disp('Condition Number');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), condition_numbers(i, 1), condition_numbers(i, 2), condition_numbers(i, 3), condition_numbers(i, 4), condition_numbers(i, 5));
end
