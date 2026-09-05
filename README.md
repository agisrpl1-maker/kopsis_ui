# kopsis_ui

A new Flutter project.

## Diagnosis Overflow

- Bagian yang meluber: nama barang pada `ListTile`, yaitu `title` di `BarangCard`.
- Penyebab: nama panjang dirender sebagai `Text(widget.nama)` tanpa batas baris atau perilaku overflow, sedangkan `leading` dan `trailing` mengambil ruang horizontal tetap.
- Perbaikan yang dipilih: batasi nama menjadi satu baris dan gunakan ellipsis agar tetap terbaca tanpa melewati batas kartu.
