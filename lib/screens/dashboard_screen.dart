// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            const Text(
              'Selamat Datang,',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            const Text(
              'Imam Rifai',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Card Saldo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Saldo Saat Ini',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Rp 1.234.567',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Lihat Detail Transaksi',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Tambahan kreatif 1: Quick Actions
            const Text(
              'Menu Cepat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _quickMenu(Icons.add_circle, 'Top Up'),
                _quickMenu(Icons.send, 'Transfer'),
                _quickMenu(Icons.payment, 'Bayar'),
                _quickMenu(Icons.history, 'Riwayat'),
              ],
            ),

            const SizedBox(height: 24),

            // Tambahan kreatif 2: Riwayat Transaksi
            const Text(
              'Riwayat Terakhir',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.arrow_downward, color: Colors.green),
                  title: Text('Top Up'),
                  subtitle: Text('27 Sept 2025'),
                  trailing: Text(
                    '+ Rp 100.000',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_upward, color: Colors.red),
                  title: Text('Transfer ke Budi'),
                  subtitle: Text('26 Sept 2025'),
                  trailing: Text(
                    '- Rp 50.000',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.payment, color: Colors.orange),
                  title: Text('Bayar Listrik'),
                  subtitle: Text('25 Sept 2025'),
                  trailing: Text(
                    '- Rp 200.000',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Tambahan kreatif 3: Banner Promo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Promo Spesial! Bayar tagihan bebas biaya admin hingga akhir bulan 🎉',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget bantu untuk Quick Menu
  Widget _quickMenu(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue.shade100,
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
