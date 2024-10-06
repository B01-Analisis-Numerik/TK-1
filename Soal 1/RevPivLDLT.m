% Mendapatkan A dari hasil Diagonal Pivoting LDLT
% Kelompok 1 - Kelas B

function [A_rev] = RevPivLDLT(L, D, p)
  % Inisialisasi n yaitu ukuran matriks persegi L dan U
  [n, ~] = size(L);

  % Buat matriks diagonal Dmat
  Dmat = diag(D);

  % Hitung LDL^T
  A_temp = L * Dmat * transpose(L);
  % Terapkan permutasi pada baris dan kolom
  A_rev       = zeros(n, n);
  A_rev(p, p) = A_temp;
end

