% Faktorisasi LU secara Iteratif
% Kelompok 1 - Kelas B

function [L, U] = Iterative(A)
  % Inisialisasi ukuran matriks persegi A
  [n, n] = size(A);

  % Inisialisasi L sebagai matriks identitas, dan U sebagai salinan A
  L = eye(n);
  U = A;

  % Iterasi untuk setiap pivot (dari baris dan kolom pertama hingga n-1)
  for k = 1:n-1
    % Step 1: Ambil elemen pivot a11
    a11 = U(k, k);

    % Cek apakah elemen pivot bernilai nol
    if a11 == 0
      error('Faktorisasi gagal');
    end

    % Step 2: Ambil vektor b (baris pertama tanpa elemen a11)
    bT = U(k, k+1:n);

    % Step 3: Ambil vektor c (kolom pertama tanpa elemen a11)
    c = U(k+1:n, k);

    % Step 4: Update submatriks D
    % Lakukan operasi untuk membuat elemen di bawah pivot menjadi nol pada U
    for i = k+1:n
      % Step 5: Hitung elemen L (L21)
      L(i, k) = U(i, k) / a11;

      % Step 6: Update baris i pada U menggunakan elemen L(i, k) dan vektor b
      % U(i, k+1:n) = U(i, k+1:n) - L(i, k) * bT
      U(i, k+1:n) = U(i, k+1:n) - L(i, k) * bT;

      % Step 7: Set elemen U di bawah pivot menjadi nol
      U(i, k) = 0;
    end
  end
end
