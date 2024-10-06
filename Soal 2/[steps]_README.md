# Tugas Kelompok 1
## Analisis Numerik
Kelas B - Kelompok 1 - 2024/2025 Gasal

### Anggota Kelompok
| Nama Kelompok | NPM |
| -- | -- |
| Adrian Aryaputra Hamzah | 2206811474 |
| Akmal Ramadhan | 2206081534 |
| Muh.Kemal Lathif Galih Putra | 2206081225 |
| Sabrina Aviana Dewi | 2206030520

### Langkah-Langkah Menjalankan Nomer 2a
Precondition: 
- Harus sudah memiliki semua file yang dibutuhkan untuk projek ini. Folder Soal 1 dan 2
- Harus sudah memasukkan data file ("pokindex_data.csv") ke folder yang sama dengan file function di soal ini.

##### a.i dan ii) Standarisasi Data, EigenVector, dan EigenValue:
Jalankan function : `[Ev, Xs , b, Eig_val] = eigen_qr_cov_matrix(file_name, iterations);`

Keterangan
- file_name: Nama file dataset yang digunakan ("pokindex_data.csv")
- iterations : Jumlah iterasi yang diperlukan agar matrix covarians jadi eigvec dan eigval (MINIMAL 40 iterasi dan Genap)

Contoh:
`[Ev, Xs , b, Eig_val] = eigen_qr_cov_matrix("pokindex_data.csv", 40);`

##### a.iii) PCA:
Jalankan function : `[Z] = pca_transform(Ev, Xs, k);`

Keterangan
- Parameter Ev dan Xs didapatkan dari output function a.i dan ii
- Parameter k menggunakan k=5 (Penjelasan di Laporan TK)

Contoh:
`[Z] = pca_transform(Ev, Xs, k);`

##### a.iv) Regresi Linear:
Jalankan function untuk masing-masing algoritma:
1. Persamaan Normal     :  
    `[X, res] = regres_lin_normal(Z, b);`
2. Householder Dengan Q : 
    
    i) `[Q, R] = qr_householder_optimized(Z);`
    
    ii) `[x, res] = regres_lin_withQ(Q, R, b);`
3. Householder Tanpa Q  : 
    
    i) `[R, bt] = qr_householder_woQ_optimized(Z, b);`
    
    ii) `[x, res] = regres_lin_woQ(R, bt);`

Keterangan
- Parameter Z didapatkan dari output function a.iii
- Parameter b didapatkan dari output function a.i dan ii
- Parameter Q, R, dan bt didapatkan dari pemanggilan QR householder yang bersesuaian.

#### Rangkuman Pemanggilan Regresi Linear:
1. Persamaan Normal: 

    [Ev, Xs , b, Eig_val] = eigen_qr_cov_matrix("pokindex_data.csv", 40);

    [Z] = pca_transform(Ev, Xs, k);

    [X, res] = regres_lin_normal(Z, b)

2. Householder Dengan Q:

    [Ev, Xs , b, Eig_val] = eigen_qr_cov_matrix("pokindex_data.csv", 40);

    [Z] = pca_transform(Ev, Xs, k);

    [Q, R] = qr_householder_optimized(Z);

    [x, res] = regres_lin_withQ(Q, R, b)

3. Householder Tanpa Q:
    
    [Ev, Xs , b, Eig_val] = eigen_qr_cov_matrix("pokindex_data.csv", 40);
    
    [Z] = pca_transform(Ev, Xs, k);
    
    [R, bt] = qr_householder_woQ_optimized(Z, b);
    
    [x, res] = regres_lin_woQ(R, bt)

#### Cara Cepat (Function Gabungan Dari Cara Diatas)
Jalankan: `regres_lin_full(iteration);`

Contoh : 

regres_lin_full(40);

### Langkah-Langkah Menjalankan Nomer 2b

Precondition: 
- Harus sudah memiliki semua file yang dibutuhkan untuk projek ini. Folder Soal 1 dan 2
- Harus sudah memasukkan data file ("pokindex_data.csv") dan ("pokindex_data_nooutlier") ke folder yang sama dengan file function di soal ini.


##### b) Data Outlier:
Jalankan function: `regres_lin_no_outlier(iteration);`

Keterangan
- iteration minimal 40

Contoh: 

regres_lin_no_outlier(40);
