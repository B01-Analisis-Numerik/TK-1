import numpy as np
import time
import sys

sys.setrecursionlimit(2000)

def band_mat(N, p, q):
    """
    Fungsi untuk menghasilkan matriks banded dengan ukuran N×N
    lebar pita bawah p dan lebar pita atas q.
    """
    A = np.zeros((N, N))
    for i in range(N):
        for j in range(max(0, i - p), min(N, i + q + 1)):
            A[i, j] = np.random.rand()
    return A

def recursive_lu(A):
    # Inisialisasi n yaitu ukuran matriks persegi A
    n = A.shape[0]

    # Base case: Jika matriks hanya berukuran 1x1, rekursif berhenti
    if n == 1:
        L = np.array([[1]])
        U = A.copy()
        return L, U

    # Step 1: Ambil elemen pertama a11
    a11 = A[0, 0]

    # Step 2: Ambil vektor b
    bT = A[0, 1:n]

    # Step 3: Ambil vektor c
    c = A[1:n, 0]

    # Step 4: Ambil submatriks D
    D = A[1:n, 1:n]

    # Step 5: Update submatriks D
    L21 = c / a11
    D_new = D - np.outer(L21, bT)

    # Step 6: Rekursif untuk faktorisasi pada submatriks D_new
    L22, U22 = recursive_lu(D_new)

    # Step 7: Gabungkan hasil untuk matriks L dan U
    L = np.block([
        [np.array([[1]]), np.zeros((1, n-1))],
        [L21.reshape(-1, 1), L22]
    ])

    U = np.block([
        [np.array([[a11]]), bT.reshape(1, -1)],
        [np.zeros((n-1, 1)), U22]
    ])

    return L, U

# Ukuran matriks N yang akan diuji
N_values = [16, 64, 128, 256, 512, 1000]

# Konfigurasi bandwidth (p, q)
bandwidths = [(1, 1), (2, 1), (3, 4), (N_values[-1]//4, N_values[-1]//4), (N_values[-1]//2, N_values[-1]//2)]

# Inisialisasi tabel hasil untuk waktu eksekusi dan condition number
results_recursive_time = np.zeros((len(N_values), len(bandwidths)))
condition_numbers = np.zeros((len(N_values), len(bandwidths)))

# Loop melalui ukuran N
for i, N in enumerate(N_values):
    # Loop melalui setiap konfigurasi bandwidth (p, q)
    for j, (p, q) in enumerate(bandwidths):
        # Generate matriks banded untuk N dan (p, q)
        A = band_mat(N, p, q)

        # Generate vektor b secara acak
        b = np.random.rand(N)

        # Hitung condition number sekali untuk tiap (N, p, q)
        kondA = np.linalg.cond(A)
        condition_numbers[i, j] = kondA

        # --- Faktorisasi dan Penyelesaian SPL dengan Recursive ---
        start_time = time.time()
        L_recursive, U_recursive = recursive_lu(A)  # Faktorisasi LU Recursive
        y_recursive = np.linalg.solve(L_recursive, b)  # Penyelesaian untuk y
        x_recursive = np.linalg.solve(U_recursive, y_recursive)  # Penyelesaian untuk x
        exec_time_recursive = time.time() - start_time

        # Simpan hasil waktu eksekusi untuk LU Recursive
        results_recursive_time[i, j] = exec_time_recursive

        # Tampilkan hasil sementara
        print(f'N = {N}, p = {p}, q = {q}')
        print(f'Recursive Time: {exec_time_recursive:.6f}')
        print(f'Condition Number: {kondA:.6f}\n')

# Tampilkan hasil waktu eksekusi dalam format tabel untuk Recursive
print('Waktu Eksekusi (dalam detik) Recursive')
print('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)')
for i, N in enumerate(N_values):
    print(f'{N} \t\t ' + ' \t\t '.join(f'{results_recursive_time[i, j]:.6f}' for j in range(len(bandwidths))))

# Tampilkan hasil condition number dalam format tabel
print('\nCondition Number')
print('N \t\t (1, 1) \t\t (2, 1) \t\t (3, 4) \t\t (N/4, N/4) \t\t (N/2, N/2)')
for i, N in enumerate(N_values):
    print(f'{N} \t\t ' + ' \t\t '.join(f'{condition_numbers[i, j]:.6f}' for j in range(len(bandwidths))))
