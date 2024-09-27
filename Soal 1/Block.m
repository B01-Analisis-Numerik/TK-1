% Faktorisasi LU dengan Block
% Kelompok 1 - Kelas B

function [L, U] = Block(A)
  % Inisialisasi ukuran matriks persegi A
  [n, n] = size(A);

  % Inisialisasi L sebagai matriks identitas dan U sebagai A
  L = eye(n);
  U = A;

  % Tentukan ukuran blok k (misalnya, setengah dari ukuran matriks)
  k = floor(n / 2);

  % Iterasi melalui blok-blok
  for i = 1:k:n
    % Tentukan batas blok saat ini
    block_size = min(k, n - i + 1);

    % Memisahkan submatriks blok saat ini
    A11 = U(i:i+block_size-1, i:i+block_size-1);
    A12 = U(i:i+block_size-1, i+block_size:n);
    A21 = U(i+block_size:n, i:i+block_size-1);
    A22 = U(i+block_size:n, i+block_size:n);

    % 1. Faktorisasi A11 menjadi L11 dan U11
    [L11, U11] = LUFact(A11);

    % 2. Hitung U12 = L11 \ A12
    U12 = L11 \ A12;

    % 3. Hitung L21 = A21 / U11
    L21 = A21 / U11;

    % 4. Update submatriks D (A22) menjadi S
    S = A22 - L21 * U12;

    % 5. Memperbarui blok-blok di matriks L dan U
    U(i:i+block_size-1, i:i+block_size-1) = U11;
    U(i:i+block_size-1, i+block_size:n) = U12;
    U(i+block_size:n, i+block_size:n) = S;

    L(i+block_size:n, i:i+block_size-1) = L21;
    L(i:i+block_size-1, i:i+block_size-1) = L11;
    U(i+block_size:n, i:i+block_size-1) = 0;
  end
end
