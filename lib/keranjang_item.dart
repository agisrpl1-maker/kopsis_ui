import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final num hargaAnggota;

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.hargaAnggota,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  void initState() {
    super.initState();
    print('initState dipanggil');
  }

  @override
  void dispose() {
    print('dispose dipanggil');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build dipanggil');
    final totalHarga = jumlah * widget.hargaAnggota;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Total Rp${_formatRupiah(totalHarga)}',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        IconButton(
          tooltip: 'Kurangi jumlah',
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (jumlah > 0) jumlah--;
            });
          },
        ),
        SizedBox(
          width: 18,
          child: Text('$jumlah', textAlign: TextAlign.center),
        ),
        IconButton(
          tooltip: 'Tambah jumlah',
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          icon: const Icon(Icons.add),
          onPressed: () {
            if (jumlah >= widget.stok) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      'Jumlah tidak boleh melebihi stok (${widget.stok}).',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              return;
            }

            setState(() {
              jumlah++;
            });
          },
        ),
      ],
    );
  }

  String _formatRupiah(num value) {
    final digits = value.toInt().toString();
    return digits.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
  }
}
