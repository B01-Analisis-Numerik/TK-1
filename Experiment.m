% Ukuran matriks N yang akan diuji
N_values = [16, 64, 128, 256, 512, 1000, 5000, 10000];

% Konfigurasi bandwidth (p, q)
bandwidths = {[1, 1], [2, 1], [3, 4], [N_values(end)/2, N_values(end)/2]};

% Inisialisasi tabel hasil
results = zeros(length(N_values), length(bandwidths));

% Loop melalui ukuran N
for i = 8:8
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

    % Hitung waktu eksekusi faktorisasi LU dengan pivot
    tic;
    [L, U, piv] = Pivot(A);
    [L, U] = Block(A);
    [L, U] = Recursive(A);
    exec_time = toc;

    % Lakukan Forward Substitution untuk Ly = b
    y = ForwardSubstitution(L, b);

    % Lakukan Back Substitution untuk Ux = y
    x = BackSubstitution(U, y);

    % Simpan waktu eksekusi di tabel hasil
    results(i, j) = exec_time;
    fprintf('Waktu: %.6f\n', results(i, j));
  end
end

% Tampilkan hasil dalam format tabel
disp('Waktu Eksekusi (dalam detik)');
disp('N \t (1, 1) \t (2, 1) \t (3, 4) \t (N/2, N/2)');
for i = 8:8
  fprintf('%d \t %.6f \t %.6f \t %.6f \t %.6f\n', N_values(i), results(i, 1), results(i, 2), results(i, 3), results(i, 4));
end

