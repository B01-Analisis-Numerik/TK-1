% Matriks Banded dan SPD generator
% Kelompok 1 - Kelas B

function A = BMSPB(N, q)
  % Fungsi untuk menghasilkan matriks banded simetris positif definit
  % dengan ukuran N×N, lebar pita bawah dan atas q (p = q).

  % Loop hingga matriks yang dihasilkan positif definit
  while true
    % Inisialisasi matriks N×N dengan nilai nol
    A = zeros(N, N);

    % Mengisi pita atas (termasuk diagonal utama) sesuai dengan q
    for i = 1:N
      for j = i:min(N, i+q)
        A(i, j) = rand();
        % Membuat matriks simetris
        if i ~= j
          A(j, i) = A(i, j);
        end
      end
    end

    % Memeriksa apakah matriks A positif definit
    try
      chol(A);
      % Jika A positif definit, keluar dari loop
      break;
    catch
      % Jika A tidak positif definit, ulangi pembuatan matriks
      continue;
    end
  end
end


