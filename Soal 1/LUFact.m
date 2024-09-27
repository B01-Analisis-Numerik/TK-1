% Faktorisasi LU
% Kelompok 1 - Kelas B

function [L, U] = LUFact(A)
  % Inisalisasi n yaitu ukuran matriks persegi A
  [n, n] = size(A);

  % Matriks L dan U diinisialisasi
  L = eye(n);
  U = A;

  % Eliminasi Gauss untuk dekomposisi A menjadi L dan U
  for i = 1:n-1
    for j = i+1:n
      % Hitung faktor pengali untuk eliminasi Gauss
      L(j, i) = U(j, i) / U(i, i);

      % Eliminasi baris pada matriks U
      U(j, :) = U(j, :) - L(j, i) * U(i, :);
    end
  end
end

