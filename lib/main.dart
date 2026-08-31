import 'package:flutter/material.dart';
import 'barang_card.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40, 'kategori': 'ATK'},
    {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 25, 'kategori': 'ATK'},
    {'nama': 'Roti', 'anggota': 5000, 'umum': 5500, 'stok': 20, 'kategori': 'Makanan'},
    {'nama': 'Es Teh', 'anggota': 3000, 'umum': 3500, 'stok': 20, 'kategori': 'Minuman'},
    {'nama': 'Pensil', 'anggota': 2000, 'umum': 2500, 'stok': 30, 'kategori': 'ATK'},
    {'nama': 'Penghapus', 'anggota': 1500, 'umum': 2000, 'stok': 25, 'kategori': 'ATK'},
    {'nama': 'Penggaris', 'anggota': 3000, 'umum': 3500, 'stok': 10, 'kategori': 'ATK'},
    {'nama': 'Air Mineral', 'anggota': 2500, 'umum': 3000, 'stok': 25, 'kategori': 'Minuman'},
    {'nama': 'Keripik', 'anggota': 4000, 'umum': 4500, 'stok': 18, 'kategori': 'Makanan'},
    {'nama': 'Spidol', 'anggota': 5000, 'umum': 6000, 'stok': 12, 'kategori': 'ATK'},
  ];

  @override
  Widget build(BuildContext context) {
    final tersedia =
        daftarBarang.where((barang) => barang['stok'] > 0).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: ListView.builder(
          itemCount: tersedia.length,
          itemBuilder: (context, index) {
            final barang = tersedia[index];

            return BarangCard(
              nama: barang['nama'],
              hargaAnggota: barang['anggota'],
              hargaUmum: barang['umum'],
              stok: barang['stok'],
              kategori: barang['kategori'],
            );
          },
        ),
      ),
    );
  }
}