import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    const namaDisorot = {
      'Buku Tulis',
      'Pulpen',
      'Pensil',
      'Penghapus',
      'Penggaris',
    };
    final isDisorot =
        nama.startsWith('Buku Tulis') || namaDisorot.contains(nama);
    final kategoriIcon = switch (kategori) {
      'Makanan' => Icons.restaurant,
      'Minuman' => Icons.local_drink,
      _ => Icons.edit,
    };
    final kategoriColor = switch (kategori) {
      'Makanan' => Colors.orange,
      'Minuman' => Colors.teal,
      _ => Colors.indigo,
    };
    return Card(
      color: isDisorot ? const Color(0xfffff7bd) : Colors.white,
      margin: EdgeInsets.zero,
      elevation: 1,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: kategoriColor.withValues(alpha: 0.14),
                  child: Tooltip(
                    message: kategori,
                    child: Icon(kategoriIcon, color: kategoriColor, size: 21),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _infoRow(
              label: 'Anggota',
              value: _formatRupiah(hargaAnggota),
              bold: true,
            ),
            _infoRow(label: 'Umum', value: _formatRupiah(hargaUmum)),
            _infoRow(label: 'Stok', value: '$stok'),
            const Spacer(),
            const Divider(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: KeranjangItem(stok: stok, hargaAnggota: hargaAnggota),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow({
    required String label,
    required String value,
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(width: 68, child: Text(label)),
          Text(
            value,
            style: TextStyle(fontWeight: bold ? FontWeight.w700 : null),
          ),
        ],
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
