import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';
import 'product_list_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Dashboard Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // Rute awal (halaman pertama)
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/products': (context) => const ProductListPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
