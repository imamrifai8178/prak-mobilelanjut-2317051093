import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list produk (bisa nanti diganti dari database)
    final List<Map<String, String>> products = [
      {"name": "Keripik Pisang Coklat", "price": "Rp 10.000"},
      {"name": "Keripik Pisang Greentea", "price": "Rp 12.000"},
      {"name": "Keripik Pisang Vanilla", "price": "Rp 11.000"},
      {"name": "Keripik Pisang Stroberi", "price": "Rp 13.000"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Produk"),
        backgroundColor: Colors.orange,
      ),
      // Tampilkan daftar produk menggunakan ListView.builder
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.orange),
              title: Text(item["name"]!),
              subtitle: Text(item["price"]!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Aksi saat item ditekan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item['name']} dipilih")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
