import 'package:aplikasi/app/models/hari_models.dart';
import 'package:aplikasi/app/screen/hari/ubah_page.dart';
import 'package:aplikasi/app/screen/hari/widgets/hari_widget.dart';
import 'package:flutter/material.dart';

import 'tambah_page.dart';

class HariPage extends StatefulWidget {
  const HariPage({Key? key}) : super(key: key);

  @override
  State<HariPage> createState() => _HariPageState();
}

class _HariPageState extends State<HariPage> {
  final List<HariContent> haricontent = [
    HariContent(tanggal: "Senin, 11/04/202"),
    HariContent(tanggal: "Selasa, 12/04/2022"),
    HariContent(tanggal: "Rabu, 13/04/2022"),
    HariContent(tanggal: "Kamis, 14/04/2022"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Laporan Penjualan perhari"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const TambahPage())),
          child: const Icon(Icons.add)),
      body: Center(
        child: ListView.builder(
          itemCount: haricontent.length,
          itemBuilder: (context, index) => Hari(content: haricontent[index]),
        ),
      ),
    );
  }
}
