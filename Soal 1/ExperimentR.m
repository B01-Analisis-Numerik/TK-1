% Hitung Relative Error untuk setiap kasus uji
% Kelompok 1 - Kelas B

% Ukuran matriks N yang akan diuji
N_values = [16, 64, 128, 256, 512, 1000];

% Konfigurasi bandwidth (p, q)
bandwidths = {[1, 1], [2, 1], [3, 4], [N_values(end)/4, N_values(end)/4], [N_values(end)/2, N_values(end)/2]};

% Inisialisasi tabel hasil untuk relative error
results_pivot_residual = zeros(length(N_values), length(bandwidths));
results_block_residual = zeros(length(N_values), length(bandwidths));
results_recursive_residual = zeros(length(N_values), length(bandwidths));

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

    % --- Faktorisasi dan Penyelesaian SPL dengan Pivot ---
    [L_pivot, U_pivot, piv] = Pivot(A);  % Faktorisasi LU dengan Pivot
    y_pivot = BackSubs(L_pivot, b);      % Backward substitution untuk y
    x_pivot = BackSubs(U_pivot, y_pivot); % Backward substitution untuk x
    residual_pivot = run_accuracy(A, L_pivot, U_pivot);

    % Simpan hasil residual untuk LU Pivot
    results_pivot_residual(i, j) =residual_pivot;

    % --- Faktorisasi dan Penyelesaian SPL dengan Block ---
    [L_block, U_block] = Block(A);       % Faktorisasi LU Block
    y_block = BackSubs(L_block, b);      % Backward substitution untuk y
    x_block = BackSubs(U_block, y_block); % Backward substitution untuk x
    residual_block = run_accuracy(A, L_block, U_block);

    % Simpan hasil residual untuk LU Block
    results_block_residual(i, j) = residual_block;

    % --- Faktorisasi dan Penyelesaian SPL dengan Recursive ---
    if N <= 128  % Batasi Recursive untuk N <= 128
      [L_recursive, U_recursive] = Recursive(A);  % Faktorisasi LU Recursive
      y_recursive = BackSubs(L_recursive, b);            % Backward substitution untuk y
      x_recursive = BackSubs(U_recursive, y_recursive);  % Backward substitution untuk x
      residual_recursive = run_accuracy(A, L_recursive, U_recursive);
    else
      residual_recursive = NaN;  % Jika N > 128, set sebagai NaN
    end

    % Simpan hasil residual untuk LU Recursive
    results_recursive_residual(i, j) = residual_recursive;

    % Tampilkan hasil sementara
    fprintf('N = %d, p = %d, q = %d\n', N, p, q);
    fprintf('Pivot Error: %.6f, Block Error: %.6f, Recursive Error: %.6f\n', residual_pivot, residual_block, residual_recursive);
  end
end

% Tampilkan hasil relative error dalam format tabel
disp('Relative Error Pivot');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), results_pivot_residual(i, 1), results_pivot_residual(i, 2), results_pivot_residual(i, 3), results_pivot_residual(i, 4), results_pivot_residual(i, 5));
end

% Tampilkan hasil relative error dalam format tabel untuk Block
disp('Relative Error Block');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), results_block_residual(i, 1), results_block_residual(i, 2), results_block_residual(i, 3), results_block_residual(i, 4), results_block_residual(i, 5));
end

% Tampilkan hasil relative error dalam format tabel untuk Recursive (Catatan: Matikan saat N > 128)
disp('Relative Error Recursive');
fprintf('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)\n');
for i = 1:length(N_values)
  fprintf('%d \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f \t\t %.6f\n', N_values(i), results_recursive_residual(i, 1), results_recursive_residual(i, 2), results_recursive_residual(i, 3), results_recursive_residual(i, 4), results_recursive_residual(i, 5));
end
