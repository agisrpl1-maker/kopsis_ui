# kopsis_ui

A new Flutter project.

## Diagnosis Overflow

- Bagian yang meluber: nama barang pada `ListTile`, yaitu `title` di `BarangCard`.
- Penyebab awal: nama panjang tidak memiliki batas baris atau perilaku overflow, sedangkan `leading` dan `trailing` mengambil ruang horizontal tetap.
- Perbaikan yang dipilih: batasi nama menjadi satu baris dan gunakan ellipsis agar tetap terbaca tanpa melewati batas kartu.

## Struktur Widget Akhir

```text
Scaffold
├── AppBar (judul: Koperasi Sekolah)
└── body: Column
	├── TextField (kotak pencarian)
	└── Expanded
		└── LayoutBuilder (menentukan jumlah kolom)
			└── GridView.builder
				└── BarangCard (stateless)
					└── KeranjangItem (stateful)
```
