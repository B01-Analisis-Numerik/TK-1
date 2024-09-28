% Faktorisasi LU dengan Pivot khusus Cholesky
% Kelompok 1 - Kelas B

function [L, p] = PivSPD(A, p)
  % Input:
  % A -> Matriks simetris positif definit berpita dengan lebar pita bawah dan atas p
  % p -> Lebar pita bawah dan atas (simetris)

  % Ukuran matriks A
  [n, ~] = size(A);

  % Inisialisasi L sebagai matriks nol berukuran NxN
  L = zeros(n, n);

  % Inisialisasi vektor pivot untuk mencatat pertukaran baris
  piv = 1:n;

  % Iterasi untuk dekomposisi Cholesky dalam pita
  for k = 1:n
    % Step 1: Pivoting - Cari elemen terbesar dalam kolom k dari k hingga min(k + p, n)
    [~, maxIndex] = max(abs(A(k:min(k + p, n), k)));
    maxIndex = maxIndex + (k - 1); % Adjust index to full matrix

    % Step 2: Tukar baris dan kolom jika diperlukan
    if maxIndex ~= k
      % Tukar baris maxIndex dengan baris k pada A (baris)
      A([k, maxIndex], :) = A([maxIndex, k], :);
      % Tukar kolom maxIndex dengan kolom k pada A (kolom)
      A(:, [k, maxIndex]) = A(:, [maxIndex, k]);

      % Tukar baris di L (hanya kolom 1:k-1 karena bagian segitiga bawah)
      if k > 1
        L([k, maxIndex], 1:k-1) = L([maxIndex, k], 1:k-1);
      end

      % Catat pertukaran di vektor pivot
      piv([k, maxIndex]) = piv([maxIndex, k]);
    end

    % Step 3: Hitung elemen diagonal L(k, k)
    L(k, k) = sqrt(A(k, k) - sum(L(k, max(1, k-p):k-1).^2));

    % Step 4: Hitung elemen-elemen di bawah diagonal dalam pita
    for i = k+1:min(k+p, n)
      L(i, k) = (A(i, k) - sum(L(i, max(1, k-p):k-1) .* L(k, max(1, k-p):k-1))) / L(k, k);
    end
  end

  % Kembalikan matriks L dan vektor pivot
  p = piv;
end

