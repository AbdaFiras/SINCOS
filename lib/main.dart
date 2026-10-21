import 'package:flutter/material.dart';
import 'views/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SINCOS PLN IP',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter', // Opsional: jika nanti mau pakai custom font
      ),
      // Mengatur halaman pertama yang muncul saat aplikasi dibuka
      home: const LoginPage(),
    );
  }
}