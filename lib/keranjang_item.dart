import 'package:flutter/material.dart';
 
class KeranjangItem extends StatefulWidget {
  final int stok;
  final ValueChanged<int> onJumlahChanged;

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.onJumlahChanged,
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (jumlah > 0) jumlah--;
            });
            widget.onJumlahChanged(jumlah);
          },
        ),
        Text(jumlah.toString()),
        IconButton(
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
            widget.onJumlahChanged(jumlah);
          },
        ),
      ],
    );
  }
}