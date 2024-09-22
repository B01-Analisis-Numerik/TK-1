% Ukuran matriks N yang akan diuji
% N_values = [16, 64, 128, 256, 512, 1000, 5000, 10000];
N_values = [5000, 10000];

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
    kondA = cond(A);
    condition_numbers(i, j) = kondA;

    fprintf('Condition Number: %.6f\n\n', kondA);
  end
end


% Tampilkan hasil condition number dalam format tabel
disp('Condition Number');
disp('N \t (1, 1) \t (2, 1) \t (3, 4) \t (N/2, N/2)');
for i = 1:length(N_values)
  fprintf('%d \t %.6f \t %.6f \t %.6f \t %.6f\n', N_values(i), condition_numbers(i, 1), condition_numbers(i, 2), condition_numbers(i, 3), condition_numbers(i, 4));
end
