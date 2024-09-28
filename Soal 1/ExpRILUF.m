% Hitung Waktu Eksekusi dan Condition Number untuk setiap kasus uji
% Kelompok 1 - Kelas B

% Ukuran matriks N yang akan diuji
N_values = [16, 64, 128, 256, 512, 1000];

% Konfigurasi bandwidth (p, q)
bandwidths = {[1, 1], [2, 1], [3, 4], [N_values(end)/4, N_values(end)/4], [N_values(end)/2, N_values(end)/2]};

% Inisialisasi tabel hasil untuk waktu eksekusi dan condition number
results_recursive_time = zeros(length(N_values), length(bandwidths));
results_iterative_time = zeros(length(N_values), length(bandwidths));
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

    % --- Faktorisasi dan Penyelesaian SPL dengan Iteratif ---
    tic;
    [L_iterative, U_iterative] = Iterative(A);       % Faktorisasi LU Iteratif
    y_iterative = BackSubs(L_iterative, b);      % Backward substitution untuk y
    x_iterative = BackSubs(U_iterative, y_iterative); % Backward substitution untuk x
    exec_time_iterative = toc;

    % Simpan hasil waktu eksekusi untuk LU Iteratif
    results_iterative_time(i, j) = exec_time_iterative;

    % Tampilkan hasil sementara
    fprintf('N = %d, p = %d, q = %d\n', N, p, q);
    fprintf('Rekursif Time: %.6f, Iteratif Time: %.6f, Recursive Time: %.6f\n', exec_time_recursive, exec_time_iterative);
    fprintf('Condition Number: %.6f\n\n', kondA);
  end
end

% Tampilkan hasil waktu eksekusi dalam format tabel untuk Rekursif
disp('Waktu Eksekusi (dalam detik) Iteratif TM');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), results_recursive_time(i, 1), results_recursive_time(i, 2), results_recursive_time(i, 3), results_recursive_time(i, 4), results_recursive_time(i, 5));
end

% Tampilkan hasil waktu eksekusi dalam format tabel untuk Iteratif
disp('Waktu Eksekusi (dalam detik) Iteratif');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), results_iterative_time(i, 1), results_iterative_time(i, 2), results_iterative_time(i, 3), results_iterative_time(i, 4), results_iterative_time(i, 5));
end

% Tampilkan hasil condition number dalam format tabel
disp('Condition Number');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), condition_numbers(i, 1), condition_numbers(i, 2), condition_numbers(i, 3), condition_numbers(i, 4), condition_numbers(i, 5));
end
