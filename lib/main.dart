import 'package:flutter/material.dart';
import 'barang_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  String _kataCari = '';

  final List<Map<String, dynamic>> daftarBarang = [
    {
      'nama': 'Buku Tulis Bergaris 58 Lembar Sampul Tebal',
      'anggota': 3000,
      'umum': 3500,
      'stok': 40,
      'kategori': 'ATK',
    },
    {
      'nama': 'Pulpen',
      'anggota': 2500,
      'umum': 3000,
      'stok': 25,
      'kategori': 'ATK',
    },
    {
      'nama': 'Roti',
      'anggota': 5000,
      'umum': 5500,
      'stok': 20,
      'kategori': 'Makanan',
    },
    {
      'nama': 'Es Teh',
      'anggota': 3000,
      'umum': 3500,
      'stok': 20,
      'kategori': 'Minuman',
    },
    {
      'nama': 'Pensil',
      'anggota': 2000,
      'umum': 2500,
      'stok': 30,
      'kategori': 'ATK',
    },
    {
      'nama': 'Penghapus',
      'anggota': 1500,
      'umum': 2000,
      'stok': 25,
      'kategori': 'ATK',
    },
    {
      'nama': 'Penggaris',
      'anggota': 3000,
      'umum': 3500,
      'stok': 10,
      'kategori': 'ATK',
    },
    {
      'nama': 'Air Mineral',
      'anggota': 2500,
      'umum': 3000,
      'stok': 25,
      'kategori': 'Minuman',
    },
    {
      'nama': 'Keripik',
      'anggota': 4000,
      'umum': 4500,
      'stok': 18,
      'kategori': 'Makanan',
    },
    {
      'nama': 'Spidol',
      'anggota': 5000,
      'umum': 6000,
      'stok': 12,
      'kategori': 'ATK',
    },
  ];

  @override
  void initState() {
    super.initState();
    print('initState dipanggil');
  }

  @override
  void dispose() {
    print('dispose dipanggil');
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build dipanggil');

    final hasilPencarian =
        daftarBarang
            .where(
              (barang) =>
                  barang['stok'] > 0 &&
                  barang['nama'].toString().toLowerCase().contains(_kataCari),
            )
            .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Cari barang...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (nilai) {
                  setState(() {
                    _kataCari = nilai.toLowerCase();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Lebar layar: ${MediaQuery.of(context).size.width.toStringAsFixed(1)}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount =
                      constraints.maxWidth > 900
                          ? 3
                          : constraints.maxWidth > 600
                          ? 2
                          : 1;

                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 2.2,
                    ),
                    itemCount: hasilPencarian.length,
                    itemBuilder: (context, index) {
                      final barang = hasilPencarian[index];

                      return BarangCard(
                        nama: barang['nama'],
                        hargaAnggota: barang['anggota'],
                        hargaUmum: barang['umum'],
                        stok: barang['stok'],
                        kategori: barang['kategori'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
