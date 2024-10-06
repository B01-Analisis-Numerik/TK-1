% Mendapatkan A dari hasil Diagonal Pivoting Cholesky
% Kelompok 1 - Kelas B

function [A_rev] = RevPivSPD(L, p)
  % Inisialisasi n yaitu ukuran matriks persegi L dan U
  [n, ~] = size(L);

  % Matriks P dibuat dari vektor pivot p
  P = eye(n);
  P = P(p, :);
  disp(P)

  % Rekonstruksi matriks A dengan mengalikannya
  A_rev = transpose(P) * L * transpose(L) * P;
end


