% Mendapatkan A dari hasil Pivoting
% Kelompok 1 - Kelas B

function [A_rev] = RevPiv(L, U, p)
  % Inisialisasi n yaitu ukuran matriks persegi L dan U
  [n, ~] = size(L);

  % Matriks P dibuat dari vektor pivot p
  P = eye(n);
  P = P(p, :);

  % Rekonstruksi matriks A dengan mengalikannya
  % A_rev = inv(P) * L * U
  A_rev = P' * L * U;
end


