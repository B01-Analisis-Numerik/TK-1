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
| Kode | Penjelasan |
| -- | -- |
| [BackSubs.m](Soal%201/BackSubs.m) | Kode back substitution untuk penyelesaian Ax = b |
| [BandMat.m](Soal%201/BackMat.m) | Kode untuk generate banded matrix |
| [Block.m](Soal%201/Block.m) | Kode faktorisasi LU secara blok |
| [BlockTM.m](Soal%201/BlockTM.m) | Kode faktorisasi LU secara blok untuk matriks tridiagonal |
| [BMSPB.m](Soal%201/BMSPB.m) | Kode untuk generate banded matris yang symmetric positive definite|
| [ExpBOPT.m](Soal%201/ExpBOPT.m) | Kode untuk menghitung waktu eksekusi dan conditional number block tridiagonal|
| [Experiment.m](Soal%201/Experiment.m) | Kode untuk menghitung waktu eksekusi dan conditional number tiap kasus uji |
| [ExpRILUF.m](Soal%201/ExpRILUF.m) | Kode untuk menghitung waktu eksekusi dan conditional number iteratif |
| [Iterative.m](Soal%201/Iterative.m) | Kode faktorisas LU secara iteratif |
| [LUFact.m](Soal%201/LUFact.m) | Kode faktorisasi LU biasa |
| [MaxRec.m](Soal%201/MaxRec.m) | Kode faktorisasi LU rekursif dengan `Max Depth = 1000` |
| [Pivot.m](Soal%201/Pivot.m) | Kode faktorisasi LU dengan pivoting |
| [PivSPD.m](Soal%201/PivSPD.m) | Kode faktorisasi LU dengan pivoting untuk matriks symmetric positive definite |
| [Recursive.m](Soal%201/Recursive.m) | Kode faktorisasi LU secara rekursif |
| [ReversePivot.m](Soal%201/ReversePivot.m) | Mendapatkan A dari faktorisasi LU dengan pivot |

### Soal 2 - Regresi Linear
| Kode | Penjelasan |
| -- | -- |
| [eigen_qr_cov_matrix.m](Soal%202/eigen_qr_cov_matrix.m) | Kode perhitungan eigen vector dan eigen value dari matriks kovarian menggunakan algoritma Householder Transformation |
| [pca_transform.m](Soal%202/pca_transform.m) | Kode transformasi PCA |
| [qr_householder_withQ.m](Soal%202/qr_householder_withQ.m) | Kode QR decomposition menggunakan Householder Transformation dengan Q disimpan |
| [qr_householder_woQ.m](Soal%202/qr_householder_woQ.m) | Kode QR decomposition menggunakan Householder Transformation tanpa Q |
| [qr_householder_optimezed.m](Soal%202/qr_householder_optimezed.m) | Kode QR decomposition menggunakan Householder Transformation dengan Q disimpan (Optimasi) |
| [qr_householder_woQ_optimized.m](Soal%202/qr_householder_woQ_optimized.m) | Kode QR decomposition menggunakan Householder Transformation tanpa Q (Optimasi)|
| [regres_lin_normal.m](Soal%202/regres_lin_normal.m) | Kode regresi linear menggunakan persamaan normal |
| [regres_lin_withQ.m](Soal%202/regres_lin_withQ.m) | Kode regresi linear menggunakan Householder Transformation dengan Q disimpan |
| [regres_lin_woQ.m](Soal%202/regres_lin_woQ.m) | Kode regresi linear menggunakan Householder Transformation tanpa Q |
| [regres_lin_full.m](Soal%202/regres_lin_full.m) | Kode regresi linear untuk semua Algoritma dari Awal Sampai Akhir |
| [regres_lin_no_outlier.m](Soal%202/regres_lin_no_outlier.m) | Kode regresi linear menggunakan Householder Transformation tanpa Q untuk bandingin data outlier dan nooutlier|
| [compare_efficiency.m](Soal%202/compare_efficiency.m) | Kode membandingkan hasil, residu, dan runtime semua Algo PCR |
| [ForSub.m](Soal%202/ForSub.m) | Kode menjalankan Forward Subsitution dalam Algoritma |
