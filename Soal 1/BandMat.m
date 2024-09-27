% Matriks Banded Generator
% Kelompok 1 - Kelas B

function A = BandMat(N, p, q)
  % Fungsi untuk menghasilkan matriks banded dengan ukuran N×N
  % lebar pita bawah p dan lebar pita atas q.

  % Inisialisasi matriks N×N dengan nilai nol
  A = zeros(N, N);
  % Mengisi pita utama (diagonal utama) dan pita bawah serta atas sesuai
  % dengan p dan q
  for i = 1:N
    for j = max(1, i-p):min(N, i+q)
      A(i, j) = rand();
    end
  end
end

