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
| [BandMatSPD.m](Soal%201/BackMat.m) | Kode untuk generate banded matrix positif definit |
| [Block.m](Soal%201/Block.m) | Kode faktorisasi LU secara blok |
| [BlockTM.m](Soal%201/BlockTM.m) | Kode faktorisasi LU secara blok untuk matriks tridiagonal |
| [Bonus.m](Soal%201/Bonus.m) | Kode faktorisasi LU dengan compresses banded matrix |
| [ExpB.m](Soal%201/ExpB.m) | Kode untuk menghitung waktu eksekusi dan conditional number pada BlockTM |
| [ExpC.m](Soal%201/ExpC.m) | Kode untuk menghitung waktu eksekusi dan conditional number pada Compresses Banded Matrix |
| [Experiment.m](Soal%201/Experiment.m) | Kode untuk menghitung waktu eksekusi dan conditional number tiap kasus uji ketiga algoritma |
| [ForElim.m](Soal%201/ForElim.m) | Kode untuk menghitung forward elimination |
| [LDLTPiv.m](Soal%201/LDLTPiv.m) | Kode faktorisasi LDL^T dengan pivoting |
| [LUFact.m](Soal%201/LUFact.m) | Kode faktorisasi LU biasa |
| [Pivot.m](Soal%201/Pivot.m) | Kode faktorisasi LU dengan pivoting |
| [Recursive.m](Soal%201/Recursive.m) | Kode faktorisasi LU secara rekursif |
| [RevPiv.m](Soal%201/RevPiv.m) | Kode mendapatkan matriks A dari faktorisasi LU dengan pivot |
| [RevPivLDLT.m](Soal%201/RevPivLDLT.m) | Kode mendapatkan matriks A dari faktorisasi LDL^T dengan pivot |
| [RevPivSPD.m](Soal%201/RevPivSPD.m) | Kode mendapatkan matriks A dari faktorisasi LU dengan pivot untuk matriks symmetric positive definite |
| [ExpR.py](Soal%201/ExpR.py) | Kode untuk menghitung waktu eksekusi dan conditional number pada Recursive |

Prosedur eksperimen yang kami lakukan dapat dilihat berikut [disini](Soal%201/[steps]_README.md).

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

Prosedur eksperimen yang kami lakukan dapat dilihat berikut [disini](Soal%202/[steps]_README.md).