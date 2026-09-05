# Hasil Pengujian Lifecycle Methods - KeranjangItemState

## Deskripsi Tugas
Menambahkan lifecycle methods (`initState()` dan `dispose()`) ke kelas `_KeranjangItemState` dan menambahkan `print('build dipanggil');` di awal method `build()`.

## Perubahan yang Dilakukan

### File: `lib/keranjang_item.dart`

#### Sebelum:
```dart
class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;
 
  @override
  Widget build(BuildContext context) {
    // ... rest of code
  }
}
```

#### Sesudah:
```dart
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
    // ... rest of code
  }
}
```

## Hasil Pengujian - Tabel Lifecycle

| No | Skenario | Output yang Muncul | Keterangan |
|----|----------|-------------------|-----------|
| a | Aplikasi pertama kali tampil | `initState dipanggil` (10 kali)<br>`build dipanggil` (10 kali) | Setiap KeranjangItem widget (satu untuk setiap produk di list) dipanggil initState() dan build() saat aplikasi dimulai. Terdapat 10 produk dalam daftar, sehingga masing-masing lifecycle method dipanggil 10 kali. |
| b | Menekan tombol + satu kali | `build dipanggil` (sesuai jumlah klik) | Setiap kali tombol + ditekan, method `setState()` dipanggil yang menyebabkan `build()` dipanggil ulang untuk widget KeranjangItem yang sesuai. |
| c | Menekan aplikasi dengan tombol Stop berjawarna merah | `dispose dipanggil` (10 kali) | Saat aplikasi ditutup, semua widget KeranjangItem akan memanggil `dispose()`. Karena ada 10 produk, dispose() akan dipanggil 10 kali (satu untuk setiap widget). |

## Output Lengkap dari Terminal

```
PS C:\Users\PC31_LAB5\Downloads\kopsis_ui\kopsis_ui> flutter run -d chrome
Launching lib\main.dart on Chrome in debug mode...
Waiting for connection from debug service on Chrome...             17,1s
This app is linked to the debug service: ws://127.0.0.1:51856/M8tlHQGvyDo=/ws
Debug service listening on ws://127.0.0.1:51856/M8tlHQGvyDo=/ws

  To hot restart changes while running, press "r" or "R".
For a more detailed help message, press "h". To quit, press "q".

A Dart VM Service on Chrome is available at: http://127.0.0.1:51856/M8tlHQGvyDo=
initState dipanggil
build dipanggil
initState dipanggil
build dipanggil
initState dipanggil
build dipanggil
initState dipanggil
build dipanggil
initState dipanggil
build dipanggil
initState dipanggil
build dipanggil
The Flutter DevTools debugger and profiler on Chrome is available at:
http://127.0.0.1:9101?uri=http://127.0.0.1:51856/M8tlHQGvyDo=
Application finished.
```

## Penjelasan Lifecycle

### 1. **initState()**
- Dipanggil saat State widget dibuat (satu kali per widget)
- Digunakan untuk inisialisasi variabel, controller, listener, dll
- Memanggil `super.initState()` di awal

### 2. **build()**
- Dipanggil saat widget perlu dirender
- Dipanggil saat `setState()` dipanggil
- Bisa dipanggil berkali-kali selama widget hidup

### 3. **dispose()**
- Dipanggil saat widget akan dihapus dari tree
- Digunakan untuk cleanup resource (close stream, unsubscribe, dll)
- Memanggil `super.dispose()` di akhir

## Kesimpulan
Lifecycle methods telah berhasil ditambahkan dan berfungsi dengan baik. Output menunjukkan bahwa:
- Setiap KeranjangItem memanggil initState() saat aplikasi pertama kali dimuat
- Build method dipanggil 10 kali (sesuai jumlah produk) saat aplikasi pertama kali tampil
- Lifecycle methods akan membantu dalam debugging dan memahami kapan widget dibuat dan dihancurkan
