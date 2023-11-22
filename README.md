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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InStock App',
      theme: ThemeData(
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
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'InStock App', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
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

# Tugas 8
**1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**

Metode Navigator.push() akan menambahkan route kedalam suatu stack yang dikelola oleh Navigator sehingga setiap penambahan route akan diletakan di posisi paling atas stack. Oleh karena itu, pengguna masih dapat mengakses halaman sebelumnya.

```dart
Navigator.push(context,
    MaterialPageRoute(builder: (context) => const ShopFormPage()));
```

Berbeda dengan Navigator.push(), pushReplacement() akan menambahkan route dan pada saat yang sama menghapus route yang sedang ditampilkan tanpa mengubah kondisi elemen stack yang ada di bawahnya. Metode ini berguna saat kita ingin menggati konten halaman aplikasi sepenuhnya dengan halaman baru.

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  ));
```

**2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**

- Single-child layout widgets: widget yang mengatur tata letak 1 buah widget child. Contohnya seperti `Container` yang dapat memberikan padding, margin, dan dekorasi lain pada widget childnya. `Center` juga dapat mengatur peletakan widget childnya menjadi di tengah.
- Multi-child layout widgets: widget yang mengatur tata letak >1 buah widget childnya. Seperti `Row` dan `Column`
- Sliver widgets: widget yang mengatur tata letak dalam konteks scrollable area. Seperti `SliverList` dan `SliverGrid` yang dapat menampilkan list atau grid yang dapat di scroll.

**3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**

- TextForm field Nama Item untuk memasukkan nama item yang ingin ditambahkan. Elemen input ini memiliki validasi tidak boleh kosong.
- TextForm field Jumlah Item untuk memasukkan jumlah item yang ingin ditambahkan. Elemen input ini memiliki validasi input harus angka
- TextForm field Deskripsi untuk memberikan deskripsi terkait item yang ingin ditambahkan. Sama seperti field nama item, elemen input ini memiliki validasi tidak boleh kosong.

**4. Bagaimana penerapan clean architecture pada aplikasi Flutter?**

Penerapan clean architecture melibatkan pemisahan kode menjadi beberapa lapisan berbeda yang memiliki tanggung jawab tertentu. Cara menerapkan clean architecture dapat dilakukan dengan membuat 3 layer utama:
1. Data: layer ini bertanggung jawab dalam mendapatkan data dan dapat berbentuk API calls kepada server atau local database
2. Domain: layer tanpa dependensi dengan layer lain yang bertugas dalam business logic dari aplikasi.
3. Feature: layer presentasi aplikasi dan merupakan framework dengan kebergantungan paling besar karena mengandung interface dan event handlernya

**5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)**

1. Pada direktori `lib` saya menambahkan file baru dengan nama `shoplist_form.dart` yang didalamnya dituliskan kode sebagai berikut. 
```dart
import 'package:flutter/material.dart';
import 'package:instock/widgets/left_drawer.dart';
import 'package:instock/model/models.dart';

List<Item> itemList = [];

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Nama Produk",
                labelText: "Nama Produk",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _name = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Nama tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Jumlah",
                labelText: "Jumlah",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _amount = int.parse(value!);
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Jumlah tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                  return "Jumlah harus berupa angka!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Deskripsi",
                labelText: "Deskripsi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _description = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Deskripsi tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Item newItem = Item(
                      nama: _name,
                      jumlah: _amount,
                      deskripsi: _description,
                    );
                    itemList.add(newItem);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Produk berhasil tersimpan'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama: $_name'),
                                Text('Jumlah: $_amount'),
                                Text('Deskripsi: $_description'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  _formKey.currentState!.reset();
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}

```

2. Agar halaman form yang telah dibuat sebelumnya dapat diakses, saya menambahkan navigator pada drawer dan pada main page
```dart
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                  ));
            },
          ),
```
3. Setelah user menambahkan item, item yang terdaftar dapat dilihat melalui halaman Lihat Item. Untuk memulainya, saya membuat file baru dengan nama `models.dart` yang berisi class yang akan menyimpan data Item. Kemudian, saya membuat file baru lagi dengan nama `list_item.dart` untuk menampilkan data yang tersimpan. Selain itu, saya membuat navigator dari drawer dengan nama `Lihat daftar item` dan di main page pada tombol `Lihat Item`


# Tugas 9
**1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**

Pengambilan data JSON dapat dilakukan tanpa membuat model terlebih dahulu dengan cara mem-parsing data JSON dan mengaksesnya secara langsung. Namun, pembuatan model akan membantu penyusunan kode dengan lebih rapi sehingga apabila terjadi suatu kesalahan akan lebih mudah diperiksa

**2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**

CookieRequest adalah class yang digunakan untuk mengelola cookies dalam request HTTP. Pada flutter, instance cookies perlu dibagikan ke semua komponen untuk beberapa alasan, diantaranya agar user tetap bisa masuk meskipun melakukan navigasi ke halaman lain. Selain itu, instance cookies dapat menjaga konsistensi tiap halaman untuk memenuhi preferensi user.

**3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**

- membuat model untuk membuat data JSON
- menambahkan dependensi HTTP untuk memperbolehkan akses internet
- melakukan fetch data
- menampilkan data dengan widget `FutureBuilder`

**4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

- buat metode login pada app authentication django akan membandingkan username dan password dari input user dan database
- pada proyek flutter, tambahkan CookieRequest ke semua child widget
- buat file login.dart

**5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**

- Widget `TextField`: agar pengguna memasukkan teks ketika melakukan suatu inpt, misalnya nama pengguna dan kata sandi.
- Widget `FutureBuilder`: Widget untuk membangun widget secara asinkron. Widget ini digunakan untuk mengelola status loading, error, dan data yang tersedia.
- Widget `ListView.builder`: untuk membuat daftar yang dapat discroll.
- Widget `Column`: untuk menyusun komponen secara vertikal
- widget `SizedBox`: untuk menambahkan ruang vertikal


**6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**

1. melakukan integrasi dan membuat metode login dan logout pada proyek django, setelah itu membuat file login.dart pada proyek flutter
2. menambahkan CookiesRequest pada setiap child widget
3. membuat model dari data json proyek django dan mengcopy kode tersebut pada file baru bernama models.dart
4. Agar data yang tersimpan dapat dilihat user, buat list_item.dart yang akan menampilkan data json yang telah tersimpan
