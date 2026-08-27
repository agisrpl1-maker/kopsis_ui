import 'package:flutter/material.dart'; 
 
void main() => runApp(MyApp()); 
 
class MyApp extends StatelessWidget { 
  MyApp({super.key}); 
 
  // Variabel stok 
  int stok = 40; 
  int stokRoti = 20; 
  int stokEsTeh = 15; 
 
  String kategori = 'ATK'; 
  String kategoriRoti = 'Makanan'; 
  String kategoriEsTeh = 'Minuman'; 
 
  IconData pilihIkon(String kategori) { 
    if (kategori == 'ATK') { 
      return Icons.edit; 
    } else if (kategori == 'Makanan') { 
      return Icons.fastfood; 
    } else if (kategori == 'Minuman') { 
      return Icons.local_drink; 
    } else { 
      return Icons.inventory_2; 
    } 
  } 
 
  @override 
 
  final List<Map<String, dynamic>> daftarBarang = [ 
  {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40}, 
  {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 25}, 
  {'nama': 'Roti', 'anggota': 5000, 'umum': 5500, 'stok': 15}, 
  {'nama': 'Es Teh', 'anggota': 3000, 'umum': 3500, 'stok': 20}, 
  {'nama': 'Pensil', 'anggota': 2000, 'umum': 2500, 'stok': 30},
  {'nama': 'Penghapus', 'anggota': 1500, 'umum': 2000, 'stok': 20},
{'nama': 'Penggaris', 'anggota': 3000, 'umum': 3500, 'stok': 10},
  {'nama': 'Air Mineral', 'anggota': 2500, 'umum': 3000, 'stok': 25},
  {'nama': 'Keripik', 'anggota': 4000, 'umum': 4500, 'stok': 18},
  {'nama': 'Spidol', 'anggota': 5000, 'umum': 6000, 'stok': 12},
]; 

  Widget build(BuildContext context) { 
    return MaterialApp( 
      home: Scaffold( 
        appBar: AppBar( 
          title: const Text('Koperasi Sekolah'), 
        ), 

        // =========================
        // BODY DIGANTI DENGAN
        // LISTVIEW.BUILDER
        // =========================

        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];

            return Card(
              margin: const EdgeInsets.all(12),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                leading: const Icon(Icons.inventory_2),
                title: Text(
                  barang['nama'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Anggota Rp${barang['anggota']} | '
                  'Umum Rp${barang['umum']}',
                ),
                trailing: Text(
                  'Stok ${barang['stok']}',
                  style: TextStyle(
                    color: barang['stok'] == 0
                        ? Colors.red
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ); 
  } 
}