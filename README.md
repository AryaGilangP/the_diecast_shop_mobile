Nama : Arya Gilang P

NPM : 2306221970

Kelas : PBP F

## Tugas 7
<details>
  <summary></summary>

**Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.**

**Stateless Widget** adalah widget yang tidak memiliki "state" atau keadaan yang bisa berubah saat aplikasi berjalan. Ini berarti widget ini hanya menampilkan data statis atau informasi yang tidak akan berubah setelah di-render. 

Contoh dari Stateless Widget adalah `Text`, `Icon`, dan widget UI lainnya yang tidak memerlukan perubahan.

**Stateful Widget** adalah widget yang memiliki "state" atau keadaan yang bisa berubah saat aplikasi berjalan. Widget ini bisa merespon perubahan data, user input, atau kejadian lainnya melalui fungsi `setState()` 

 **Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.**

1. `MaterialApp` berfungsi untuk membungkus seluruh aplikasi dengan gaya dan tema material design
2. `Scaffold` kerangka utama dari setiap halaman aplikasi, menyediakan struktur dasar halaman, seperti `AppBar`, `Drawer`, dan `BottomNavigationBar`
3. `AppBar`adalah bilah aplikasi di bagian atas halaman, yang berfungsi sebagai header dan bisa menampilkan judul serta ikon.
4. `Text` Digunakan untuk menampilkan teks pada layar.
5. `Column` adalah widget layout yang mengatur widget anaknya dalam bentuk kolom vertikal.
6. `ElevatedButton` adalah tombol yang memiliki tampilan elemen "terangkat" (elevated) dengan efek bayangan, cocok untuk aksi utama dalam antarmuka.
7. `FloatingActionButton` adalah sebuah tombol bulat yang "mengambang" di atas konten halaman, biasanya digunakan untuk aksi penting atau utama seperti menambah data.

**Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**

setState() adalah fungsi yang digunakan di dalam Stateful Widget untuk memperbarui "state" atau keadaan dari widget. Saat setState() dipanggil, Flutter akan merender ulang widget sehingga perubahan yang terjadi pada variabel "state" akan ditampilkan pada layar.

Hanya variabel yang disimpan dalam State widget yang dapat dipengaruhi oleh `setState()`. Contohnya:

- Variabel dinamis seperti nilai counter, status toggle, input pengguna, data dari API, atau opsi pilihan pengguna.
- Variabel yang mempengaruhi UI secara langsung seperti variabel counter untuk menghitung jumlah klik, daftar item yang bertambah atau berkurang, nilai toggle (aktif/nonaktif), atau warna yang berubah berdasarkan interaksi pengguna.

**Jelaskan perbedaan antara const dengan final.**

`const`: Keyword `const` digunakan untuk mendefinisikan nilai yang bersifat konstan dan ditentukan saat kompilasi (compile-time constant). Ini berarti nilai tersebut tidak bisa berubah dan harus sudah diketahui ketika aplikasi sedang dikompilasi. Pada Flutter, `const` sering digunakan untuk widget atau nilai statis yang tidak akan pernah berubah, misalnya teks statis atau warna tetap.

`final`: Keyword `final` juga digunakan untuk mendefinisikan nilai yang tidak bisa diubah setelah diinisialisasi, tetapi nilainya bisa ditentukan saat runtime (runtime constant). Ini berarti nilai `final` dapat diinisialisasi berdasarkan hasil perhitungan atau input dari pengguna, selama itu hanya diinisialisasi satu kali.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.**

1. **Instalasi Flutter di Windows**  
    1. **Unduh dan Ekstrak Flutter SDK**: Download Flutter SDK dari situs resmi flutter.dev dan ekstrak ke direktori yang diinginkan.
    2.  **Tambahkan Flutter ke PATH**: Buka Command Prompt atau PowerShell dan tambahkan Flutter ke PATH.
    Gantilah `C:\path\to\flutter` sesuai lokasi folder Flutter SDK yang sudah di ekstrak.
    3. **Verifikasi Instalasi Flutter**  
    Pastikan Flutter terinstal dengan benar dengan menjalankan perintah `flutter doctor
    `
2. **Instalasi IDE untuk Pengembangan Flutter**  
    - **Visual Studio Code**: Direkomendasikan untuk pengembangan yang ringan dan fleksibel. Install ekstensi Flutter dan Dart di VS Code.  
    - **Android Studio**: Diperlukan jika ingin menjalankan emulator Android di Windows. Pastikan plugin Flutter dan Dart juga terinstal di Android Studio.  
3. **Membuat Proyek Flutter Baru**
    1. Buka Command Prompt atau PowerShell
        - Arahkan ke direktori tempat penyimpanan proyek.
    2. Buat Proyek Baru
        - Jalankan perintah berikut untuk membuat proyek Flutter baru  
        ```
        flutter create MY_APP
        cd MY_APP
        ```
    3. Jalankan Proyek  
        Untuk menjalankan proyek pada emulator atau perangkat fisik yang terhubung, gunakan perintah:
        ```
        flutter run
        ```
4. **Pengaturan Tampilan Utama (main.dart)** 
    - File `menu.dart`: Tambahkan file `menu.dart` ke dalam folder lib, dan pindahkan widget `MyHomePage`ke dalam file tersebut.

    1. Untuk membuat tiga tombol pada halaman utama, kita menggunakan widget `ItemHomepage` lalu untuk menampilkan setiap tombol menggunakan `widget` `ItemCard` dalam `GridView`.

    ```bash 
      final List<ShopItem> items = [
      ShopItem("Product List", Icons.checklist, Colors.deepOrange.shade400),
      ShopItem("Add Product", Icons.add_shopping_cart, Colors.orange.shade400),
      ShopItem("Logout", Icons.logout, Colors.lightGreen.shade400),
      ];

    ```
    2. Menampilkan tombol-tombol ini dalam `GridView` 
    ```dart
    GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: items.map((ItemHomepage item) {
            return ItemCard(item);
        }).toList(),
        ),
    ```


</details>

## Tugas 8
<details>
  <summary></summary>

**Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?**

`const` digunakan untuk mendefinisikan nilai atau objek yang bersifat konstan, yang tidak akan berubah selama runtime aplikasi.
Keuntungan Menggunakan `const` di Flutter:
1. Menghemat Memori: Ketika Anda menggunakan const, Flutter akan mengalokasikan satu objek saja di memori untuk nilai atau widget tersebut. 
2. Meningkatkan Performa: Widget yang dideklarasikan dengan `const` tidak perlu dirender ulang setiap kali aplikasi melakukan rebuild. 
3. Mengurangi Kesalahan: `const` memastikan bahwa nilai atau widget tidak berubah secara tidak sengaja selama runtime.

Kapan Sebaiknya Menggunakan `const`?
1. Untuk Widget yang Tidak Berubah
2. Untuk Nilai Konstan
3. Untuk Nested Widget yang Konstan

Kapan Sebaiknya Tidak Menggunakan `const`
1. Widget yang Dinamis
2. Variabel atau Objek yang Berubah

**Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!**

1. Column
- Digunakan untuk menyusun widget dalam arah vertikal (atas ke bawah)
- Widget yang ditambahkan ke dalam Column akan ditampilkan satu per satu dari atas ke bawah dalam urutan penambahannya.
- Contoh :
```dart
import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Column Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
        children: [
          Text('This is the first line'),
          Text('This is the second line'),
          Text('This is the third line'),
        ],
      ),
    );
  }
}
```
2. Row
- Digunakan untuk menyusun widget dalam arah horizontal (kiri ke kanan)
- Widget yang ditambahkan ke dalam Row akan ditampilkan satu per satu dari kiri ke kanan dalam urutan penambahannya.
- Contoh :
```dart
import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Example')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space evenly across the row
        crossAxisAlignment: CrossAxisAlignment.center, // Center along the vertical axis
        children: [
          Icon(Icons.star, size: 50, color: Colors.red),
          Icon(Icons.star, size: 50, color: Colors.green),
          Icon(Icons.star, size: 50, color: Colors.blue),
        ],
      ),
    );
  }
}

```

**Elemen Input Yang Digunakan**

1. TextFormField
Beberapa `TextFormField` yang digunakan adalah:
- Car Name: Untuk menginput nama mobil.
- Price: Untuk menginput harga mobil.
- Description: Untuk menginput deskripsi mobil.
- User Reviews: Untuk menginput ulasan pengguna terkait mobil.
- Ratings: Untuk menginput rating mobil dalam bentuk angka

</details>