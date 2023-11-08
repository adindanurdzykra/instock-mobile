# Tugas 7
Nama : Adinda Nurdzykra

NPM : 2206082083

**1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**

Stateless Widget merupakan widget yang tidak memiliki state internal untuk dikelola sehingga tidak bergantung pada data eksternal atau input pengguna dan tidak mengubah tampilannya saat program berjalan. Hal ini menyebabkan stateless widget bersifat immutable atau tidak dapat diubah setelah widget dibuat. Stateless widget juga bersifat idempotent atau selalu mengembalikan output yang sama untuk setiap input.

Kebalikan dari stateless widget, Stateful Widget adalah widget yang memiliki state internal untuk dikelola sehingga bergantung pada data eksternal atau input pengguna. Oleh karena itu, stateful widget bersifat mutable dan non-idempotent.

**2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**
- MyHomePage, mengatur layout halaman utama dan mendefinisikan ShopItem
- Scaffold, untuk struktur visual dasar yang mencakup AppBar, Body, dan lain-lain.
- AppBar, menampilkan AppBar di atas layar
- SingleChildScrollView, memungkinkan konten untuk dapat di scroll
- Padding, memberikan padding di sekitar widget
- Text, menampilkan string teks
- Column, untuk menampilkan daftar widget anaknya dalam tata letak vertikal.
- GridView.count, untuk menampilkan grid dengan jumlah kolom yang ditentukan oleh crossAxisCount.
- Material, memberikan efek visual material design pada widget anaknya.
- InkWell: Widget ini digunakan untuk menambahkan efek sentuhan pada widget anaknya. Dalam kasus ini, digunakan untuk menampilkan SnackBar ketika item diklik.
- Container, menggabungkan beberapa widget menjadi satu blok yang dapat diberi padding, margin, dan dekorasi.
- Icon, menampilkan ikon.
- SnackBar, menampilkan pesan singkat di bagian bawah layar.

**3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**

1. membuat proyek flutter baru dengan nama instock
2. membuat file baru dari direktori instock/lib dengan nama main.dart dan memasukkan kode dibawah ini pada main.dart
```dart
import 'package:flutter/material.dart';
import 'package:instock/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InStock App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
serta pada menu.dart
```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```