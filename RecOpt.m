% Faktorisasi LU secara Iteratif menggunakan Tumpukan
% Kelompok 1 - Kelas B

function [L, U] = RecOpt(A)
  tic; % Mulai pengukuran waktu

  % Inisialisasi n yaitu ukuran matriks persegi A
  [n, n] = size(A);

  % Inisialisasi L sebagai matriks identitas ukuran n x n
  L = eye(n);
  U = A;

  % Inisialisasi tumpukan untuk menyimpan rentang baris
  stack = {[1, n]}; % Menyimpan rentang baris

  while ~isempty(stack)
    % Ambil rentang dari tumpukan
    range = stack{end};
    stack(end) = []; % Hapus elemen terakhir dari tumpukan
    r1 = range(1);
    r2 = range(2);

    % Jika hanya ada satu elemen, tidak perlu diproses
    if r2 - r1 <= 0
      continue;
    end

    % Ambil elemen pivot
    a11 = U(r1, r1);
    bT = U(r1, r1+1:r2);
    c = U(r1+1:r2, r1);
    D = U(r1+1:r2, r1+1:r2);

    % Hitung L21 dan update D
    L21 = c / a11;
    D_new = D - L21 * bT;

    % Update L dan U
    L(r1+1:r2, r1) = L21;
    U(r1+1:r2, r1+1:r2) = D_new;

    % Masukkan submatriks yang perlu diproses ke dalam tumpukan
    stack{end+1} = {[r1+1, r2]}; % Submatriks D_new
  end
end

