import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('My Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0', // Karena stateless, kita menampilkan angka tetap.
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30), // Jarak antara teks dan tombol

            // Tombol Lihat Daftar Produk
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk melihat daftar produk di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna untuk tombol Lihat Daftar Produk
              ),
              child: const Text('Lihat Daftar Produk'),
            ),

            const SizedBox(height: 10), // Jarak antara tombol

            // Tombol Tambah Produk
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menambah produk di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Warna untuk tombol Tambah Produk
              ),
              child: const Text('Tambah Produk'),
            ),

            const SizedBox(height: 10), // Jarak antara tombol

            // Tombol Logout
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk logout di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna untuk tombol Logout
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tidak ada aksi karena tidak ada setState,
          // hanya menampilkan UI statis tanpa interaksi.
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
