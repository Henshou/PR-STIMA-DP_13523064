# TSP SOLVER USING DYNAMIC PROGRAMMING

TSP Solver ini adalah sebuah program pencarian solusi untuk sebuah permasalahan Travelling Salesman Problem. Program ini menggunakan Dynamic Programming untuk optimisasi pencarian rute dengan tambahan bitmasking untuk menandakan kota yang sudah dikunjungi untuk mempercepat penyelesaian.

## Langkah Algoritma
1. Representasi graf (jarak antar kota) disimpan dalam bentuk adjacency matrix dengan jarak antar kota diacak menggunakan SecureRandom.

2. Dynamic Programming dengan Bitmasking digunakan untuk menyimpan solusi submasalah:
    dp[pos][visited] menyimpan biaya minimum untuk mencapai semua kota yang telah dikunjungi (visited) dari kota pos.
    visited adalah bitmask (dalam bentuk bilangan biner) yang menandakan kota mana saja yang sudah dikunjungi. Misalnya, 1011 berarti kota ke-0, ke-1, dan ke-3 sudah dikunjungi.

3. Fungsi tsp(pos, visited):
    Jika semua kota sudah dikunjungi (visited == (1 << n) - 1), maka kembali ke kota asal (graph[pos][0]).
    Jika submasalah sudah pernah diselesaikan, hasilnya diambil dari memo (@memo[pos][visited]).
    Jika belum, program akan mencoba mengunjungi semua kota yang belum dikunjungi dan menghitung biaya minimum.

## Requirement dan Instalasi
Program ini berjalan dengan bahasa Ruby. Jika belum meng-install ruby, dapat melakukan instalasi melalui:

### Windows
- [rubyinstaller.org](https://rubyinstaller.org)

### Linux (Debian/Ubuntu)

```bash
sudo apt-get install ruby-full
```
### macOS
```
    brew install ruby
```

## Cara Menjalankan dan Menggunakan Program
Download program atau clone repository ini, lalu masuk ke directory tempat file TSP.rb berada.

Lalu jalankan perintah berikut di terminal:
```bash
ruby TSP.rb
```

Setelah program berhasil berjalan, user dapat memasukkan jumlah kota yang diinginkan dan program akan menjalankan solver. Setelah selesai, program akan menampilkan rute yang diambil, bobot akhir, dan waktu pengerjaan solver.

## Author
Program ini dibuat oleh:
- Samuel Gerrard Hamonangan Girsang 13523064





