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

### Soal 1 - Banded Matrix

#### Generate Banded Matrix
Untuk menghasilkan matriks banded, kami menggunakan `BandMat.m` dan `BandMatSPD.m`. Kedua kode ini menghasilkan matriks banded dengan parameter N dan k. Kode `BandMat.m` menghasilkan matriks banded biasa, sedangkan `BandMatSPD.m` menghasilkan matriks banded positif definit.

#### Waktu Eksekusi dan Conditional Number
Dalam mencatat waktu eksekusi dan conditional number untuk setiap kasus uji, kami menggunakan `Experiment.m` untuk menghitung hal tersebut. Matriks A diperoleh dari `BandMat.m`.
- Faktorisasi LU dengan Pivot: `Pivot.m`
- Faktorisasi LU secara Rekursif: `Recursive.m`
- Faktorisasi LU secara Blok: `Block.m`
- Backward Substitution: `BackSubs.m`
- Forward Elimination: `ForElim.m`
Untuk setiap kasus uji, kami menggunakan matriks A yang sama. Dilakukan faktorisasi secara tiga kali dimana untuk setiap faktorisasi dilakukan pencatatan waktu. Untuk setiap matriks A yang dibuat, dihitung conditonal numbernya. Keluaran dari kode `Experiment.m` ini yaitu tabel untuk setiap kasus uji.

Karena rekursif akan berhenti pada N > 128, maka ketika N > 128 kami langsung mengisi tabel dengan NaN.

#### Faktorisasi LU pada Matriks Simetri Definit Positif
Matriks A diperoleh dari `BandMatSPD.m`. Setelah itu, untuk faktorisasi matriks simetri definit positif, kami menggunakan `LDLTPiv.m`. Kode ini menghasilkan faktorisasi LDL^T dengan pivoting. Untuk mendapatkan matriks A dari faktorisasi ini, kami menggunakan `RevPivLDLT.m`.

#### Faktorisasi LU secara Rekursif melalui Python
Untuk faktorisasi secara rekursif, kami menggunakan `ExpR.py`. Kode ini menghitung waktu eksekusi dan conditional number untuk faktorisasi rekursif. Kode ini menghasilkan tabel waktu eksekusi dan conditional number untuk setiap kasus uji. Hal ini dikarenaan faktorisasi rekursif tidak dapat dilakukan pada Octave pada angka yang besar.

#### Faktorisasi LU secara Blok pada Matriks Tridiagonal
Untuk faktorisasi LU secara blok pada matriks tridiagonal, kami menggunakan `BlockTM.m`. Kode ini menghasilkan faktorisasi LU secara blok pada matriks tridiagonal. Untuk mendapatkan matriks A dari faktorisasi ini, kami menggunakan `RevPiv.m`.

#### Faktorisasi LU dengan Compressed Banded Matrix
Untuk faktorisasi LU dengan compressed banded matrix, kami menggunakan `Bonus.m`. Kode ini menghasilkan faktorisasi LU dengan compressed banded matrix. Untuk mendapatkan matriks A dari faktorisasi ini, kami menggunakan `RevPivSPD.m`.