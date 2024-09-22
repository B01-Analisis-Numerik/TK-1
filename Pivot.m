% Faktorisasi LU dengan Pivot
% Kelompok 1 - Kelas B

function [L, U, p] = Pivot(A)
  % Inisalisasi n yaitu ukuran matriks persegi A
  [n, n] = size(A);

  % Inisialisasi L sebagai matriks identitas ukuran n x n
  L = eye(n);

  % Inisialisasi vektor pivot p untuk mencatat pertukaran baris yang terjadi
  p = 1:n;

  for k = 1:n-1
    % Step 1: Mencari elemen terbesar dalam kolom k mulai dari baris k hingga baris n untuk menentukan pivot
    [s, v] = max(abs(A(k:n, k)));
    % Sesuaikan indeks v relatif ke seluruh matriks A
    v = v + (k - 1);

    % Step 2: Tukar baris jika pivot ditemukan namun bukan di baris ke-k
    if v ~= k
      % Tukar baris k dengan baris v di matriks A
      A([k v], k:n) = A([v k], k:n);

      % Tukar baris k dengan baris v di matriks L (hanya kolom 1:k-1)
      if k > 1
        L([k v], 1:k-1) = L([v k], 1:k-1);
      end

      % Tukar elemen vektor pivot p untuk mencatat pertukaran
      p([k v]) = p([v k]);
    end

    % Step 3: Lakukan eliminasi Gaussian di bawah elemen pivot
    for i = k+1:n
      % Hitung faktor L(i, k) yang merupakan rasio eliminasi
      L(i, k) = A(i, k) / A(k, k);

      % Update baris ke-i dengan mengurangkan L(i, k) * A pada baris ke-k
      A(i, k:n) = A(i, k:n) - L(i, k) * A(k, k:n);
    end
  end

  % Setelah proses eliminasi selesai, sisa dari matriks A adalah matriks U
  U = A;
end

