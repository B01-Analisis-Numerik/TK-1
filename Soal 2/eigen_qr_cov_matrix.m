function [Ev, Xs , b, Eig_val] = eigen_qr_cov_matrix(file_name, iterations)
  % Step 0: Jika iterations ganjil, maka kita tambahkan dengan 1 untuk menjamin iterations genap
  iterations = iterations + mod(iterations, 2);

  % Step 1: Baca file CSV
  data = csvread(file_name, 1,0); % Membaca file mulai dari baris kedua (skip header)
  data_X = data(:,1:6);
  b = data(:,7);

  % Step 2: Standarisasi data (mean centering and scaling)
  data_std = standardize_data(data_X);
  Xs = data_std;

  % Step 3: Hitung matriks kovarians
  cov_matrix = cov(data_std);

  % Step 4: Lakukan dekomposisi QR untuk mendapatkan eigenvalue dan eigenvector
  [Ak, QQ] = eigen_qr_householder(cov_matrix, iterations);

  % Step 5: Tampilkan hasil
  Eig_val = diag(Ak);

  % Eigen Vector
  Ev = QQ;
end

function data_std = standardize_data(data)
  % Mean centering and scaling (standardization)
  mu = mean(data);
  sigma = std(data);
  data_std = (data - mu) ./ sigma;  % Standardize each column of data
end

function [Ak, QQ] = eigen_qr_householder(A, iterations)
  % QR decomposition using Householder transformation to get eigenvalues and eigenvectors
  Ak = A;  % Initialize Ak
  n = size(A, 1);  % Size of the matrix
  QQ = eye(n);  % Initialize orthonormal matrix -> Q Disimpan disini

  for k = 1:iterations
    [Q, R] = qr_householder_optimized(Ak);  % QR WITH OPTIMIZED CODE
    Ak = R * Q;  % Update Ak
    QQ = QQ * Q;  % Accumulate Q to get eigenvectors
    if mod(k, 100) == 0
      disp(['Iteration: ', num2str(k)]);
    end
  end
end

% QR WITH OPTIMIZED CODE
function [Q, R] = qr_householder_optimized(A)
    [m, n] = size(A);
    Q = eye(m);
    R = A;

    for k = 1:n
        x = R(k:m, k);
        norm_x = norm(x);
        alpha = -sign(x(1)) * norm_x;
        x(1) = x(1) - alpha;
        x = x / norm(x);
        Q_k = eye(m);
        Q_k(k:m, k:m) = eye(length(x)) - 2 * (x * x');
        R = Q_k * R;
        Q = Q * Q_k;
    end
end

% QR WITHOUT OPTIMIZED CODE (Perbandingan)
function [Q, R] = qr_householder(A)
  % QR decomposition using Householder transformation
  [n, ~] = size(A);
  Q = eye(n);  % Initialize Q as an identity matrix
  R = A;  % Initialize R as the original matrix

  for k = 1:n-1
    x = R(k:n, k);
    e = zeros(length(x), 1);
    e(1) = norm(x);
    u = x - e;
    v = u / norm(u);
    Q_k = eye(n);
    Q_k(k:n, k:n) = eye(length(v)) - 2 * (v * v');
    R = Q_k * R;
    Q = Q * Q_k;
  end
end
