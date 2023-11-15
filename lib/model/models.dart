import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));
String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.nama,
    required this.jumlah,
    required this.deskripsi,
  });

  String nama;
  int jumlah;
  String deskripsi;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        nama: json["nama"],
        jumlah: json["jumlah"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "jumlah": jumlah,
        "deskripsi": deskripsi,
      };
}