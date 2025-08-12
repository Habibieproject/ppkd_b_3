import 'package:flutter/material.dart';
import 'package:ppkd_b_3/day_14/model/produk_model.dart';

class Day14ListOnListViewBuilder extends StatefulWidget {
  const Day14ListOnListViewBuilder({super.key});

  @override
  State<Day14ListOnListViewBuilder> createState() =>
      _Day14ListOnListViewBuilderState();
}

class _Day14ListOnListViewBuilderState
    extends State<Day14ListOnListViewBuilder> {
  //Step 1
  final List<String> namaBuah = ["Apel", "Nanas", "Anggur"];
  final List<Map<String, dynamic>> produk = [
    {"nama": "Baju", "price": 50000, "warna": Colors.blue},
    {"nama": "Celana", "price": 60000, "warna": Colors.red},
    {"nama": "Topi", "price": 70000, "warna": Colors.yellow},
    {"nama": "Sepatu", "price": 80000, "warna": Colors.green},
  ];
  final List<ProdukModel> produkModel = [
    ProdukModel(nama: "Baju", price: 50000, warna: Colors.blue),
    ProdukModel(nama: "Celana", price: 60000, warna: Colors.red),
    ProdukModel(nama: "Topi", price: 70000, warna: Colors.yellow),
    ProdukModel(nama: "Sepatu", price: 80000, warna: Colors.indigoAccent),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //List
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            itemCount: namaBuah.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(namaBuah[index]),
                leading: CircleAvatar(child: Text("${index + 1}")),
              );
            },
          ),
          Divider(),
          //List of Map
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            itemCount: produk.length,
            itemBuilder: (BuildContext context, int index) {
              final dataProduk = produk[index];
              return ListTile(
                title: Text(dataProduk["nama"]),
                subtitle: Text(dataProduk["price"].toString()),
                trailing: CircleAvatar(backgroundColor: dataProduk["warna"]),
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text("${index + 1}"),
                ),
              );
            },
          ),
          //Model
          Divider(),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: produkModel.length,
            itemBuilder: (BuildContext context, int index) {
              final dataProdukModel = produkModel[index];
              return ListTile(
                title: Text(dataProdukModel.nama),
                subtitle: Text(dataProdukModel.price.toString()),
                trailing: CircleAvatar(backgroundColor: dataProdukModel.warna),
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text("${index + 1}"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
