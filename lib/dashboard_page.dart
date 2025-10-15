import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          // Membuat tampilan grid 2 kolom
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            // Card menuju daftar produk
            _buildCard(context, Icons.list, "Daftar Produk", '/products', Colors.orange),
            // Card menuju profil pengguna
            _buildCard(context, Icons.person, "Profil Saya", '/profile', Colors.green),
          ],
        ),
      ),
    );
  }

  // Widget Card untuk menu Dashboard
  Widget _buildCard(BuildContext context, IconData icon, String title, String route, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: InkWell(
        // Navigasi ke halaman lain saat card ditekan
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
