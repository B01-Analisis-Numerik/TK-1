% Faktorisasi LU secara Rekursif dengan Max Depth
% Kelompok 1 - Kelas B

function [L, U] = MaxRec(A)
  % Atur kedalaman rekursif hingga 1000
  old_depth = max_recursion_depth;
  max_recursion_depth(1000);

  % Inisalisasi n yaitu ukuran matriks persegi A
  [n, n] = size(A);

  % Base case: Jika matriks hanya berukuran 1x1, rekursif berhenti
  if n == 1
    L = 1;
    U = A;
    return;
  end

  % Step 1: Ambil elemen pertama a11
  a11 = A(1,1);

  % Step 2: Ambil vektor b
  bT = A(1,2:n);

  % Step 3: Ambil vektor c
  c = A(2:n,1);

  % Step 4: Ambil submatriks D
  D = A(2:n, 2:n);

  % Step 5: Update submatriks D
  L21 = c / a11;
  D_new = D - L21 * bT;

  % Step 6: Rekursif untuk faktorisasi pada submatriks D_new
  [L22, U22] = Recursive(D_new);

  % Step 7: Gabungkan hasil untuk matriks L dan U
  L = [1,   zeros(1, n-1);
       L21, L22          ];

  U = [a11,           bT;
       zeros(n-1, 1), U22];

  max_recursion_depth(old_depth);
end


