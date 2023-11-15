import 'package:instock/model/models.dart';
import 'package:flutter/material.dart';
import 'package:instock/widgets/left_drawer.dart';

class ListItemPage extends StatelessWidget {
  final List<Item> itemList;

  const ListItemPage({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'List Item Terdaftar',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Amount')),
            DataColumn(label: Text('Description')),
          ],
          rows: itemList.map((item) {
            return DataRow(cells: [
              DataCell(Text(item.nama)),
              DataCell(Text(item.jumlah.toString())),
              DataCell(Text(item.deskripsi)),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
