import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatefulWidget {
  final String nama;
  final num hargaAnggota;
  final num hargaUmum;
  final int stok;
  final String kategori;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.hargaUmum,
    required this.stok,
    required this.kategori,
  });

  @override
  State<BarangCard> createState() => _BarangCardState();
}

class _BarangCardState extends State<BarangCard> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    const namaDisorot = {
      'Buku Tulis',
      'Pulpen',
      'Pensil',
      'Penghapus',
      'Penggaris',
    };
    final isDisorot = namaDisorot.contains(widget.nama);
    final kategoriIcon = switch (widget.kategori) {
      'Makanan' => Icons.restaurant,
      'Minuman' => Icons.local_drink,
      _ => Icons.edit,
    };
    final kategoriColor = switch (widget.kategori) {
      'Makanan' => Colors.orange,
      'Minuman' => Colors.teal,
      _ => Colors.indigo,
    };
    final totalHarga = jumlah * widget.hargaAnggota;

    return Card(
      color: isDisorot ? Colors.yellow.shade100 : null,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        leading: Tooltip(
          message: widget.kategori,
          child: CircleAvatar(
            backgroundColor: kategoriColor.withValues(alpha: 0.14),
            child: Icon(kategoriIcon, color: kategoriColor),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.nama,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              'Anggota  ${_formatRupiah(widget.hargaAnggota)}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text('Umum       ${_formatRupiah(widget.hargaUmum)}'),
            Text('Stok         ${widget.stok}'),
            const SizedBox(height: 4),
            Text(
              'Total      ${_formatRupiah(totalHarga)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
        trailing: KeranjangItem(
          stok: widget.stok,
          onJumlahChanged: (nilaiBaru) {
            setState(() {
              jumlah = nilaiBaru;
            });
          },
        ),
      ),
    );
  }

  String _formatRupiah(num value) {
    final digits = value.toInt().toString();
    final formatted = digits.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
    return 'Rp$formatted';
  }
}
