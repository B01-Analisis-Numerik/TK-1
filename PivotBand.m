% Faktorisasi LU dengan Pivot untuk Banded Matrix
% Kelompok 1 - Kelas B

function [L, U, p_vec] = PivotBand(A, p, q)
  % Inisialisasi n yaitu ukuran matriks persegi A
  [n, ~] = size(A);

  % Inisialisasi L sebagai matriks identitas ukuran n x n
  L = eye(n);

  % Inisialisasi vektor pivot p_vec untuk mencatat pertukaran baris yang terjadi
  p_vec = 1:n;

  for k = 1:n-1
    % Step 1: Mencari elemen terbesar dalam kolom k mulai dari
    % baris k hingga baris min(k + p, n) untuk menentukan pivot
    [s, v] = max(abs(A(k:min(k + p, n), k)));
    % Sesuaikan indeks v relatif ke seluruh matriks A
    v = v + (k - 1);

    % Step 2: Tukar baris jika pivot ditemukan namun bukan di baris ke-k
    if v ~= k
      % Tukar baris k dengan baris v di matriks A
      A([k v], :) = A([v k], :);

      % Tukar baris k dengan baris v di matriks L (hanya kolom 1:k-1)
      if k > 1
        L([k v], 1:k-1) = L([v k], 1:k-1);
      end

      % Tukar elemen vektor pivot p_vec untuk mencatat pertukaran
      p_vec([k v]) = p_vec([v k]);
    end

    % Step 3: Lakukan eliminasi Gaussian di bawah elemen pivot dalam pita
    for i = k+1:min(k + p, n)
      % Hitung faktor L(i, k) yang merupakan rasio eliminasi
      L(i, k) = A(i, k) / A(k, k);

      % Update baris ke-i dengan mengurangkan L(i, k) * A pada baris ke-k
      for j = k:min(k + q, n)
        A(i, j) = A(i, j) - L(i, k) * A(k, j);
      end
    end
  end

  % Setelah proses eliminasi selesai, sisa dari matriks A adalah matriks U
  U = A;
end

