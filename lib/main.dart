import 'package:flutter/material.dart';
import 'package:the_diecast_shop_mobile/screens/menu.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Pastikan package ini sudah ditambahkan ke `pubspec.yaml`

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest(); // Membuat instance CookieRequest
        return request; // Menggunakan request sebagai provider
      },
      child: MaterialApp(
  title: 'Fufufafa Shop',
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.red, // Ganti menjadi warna merah
    ).copyWith(secondary: const Color.fromARGB(255, 0, 0, 0)), // Warna aksen juga merah
  ),
  home: MyHomePage(),
),

    );
  }
}
