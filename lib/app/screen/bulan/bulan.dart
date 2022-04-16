import 'package:flutter/material.dart';
import 'package:aplikasi/app/screen/bulan/tambahbulan.dart';
import 'package:aplikasi/app/screen/hari/hari.dart';
import 'package:aplikasi/app/screen/hari/ubah_page.dart';

//Models :
import 'package:aplikasi/app/models/bulan_models.dart';

//utk konten Bulan
import 'package:aplikasi/app/screen/bulan/widgets/konten_bulan.dart';

class BulanPage extends StatefulWidget {
  const BulanPage({Key? key}) : super(key: key);

  @override
  State<BulanPage> createState() => _BulanPageState();
}

class _BulanPageState extends State<BulanPage> {
  final List<BulanContent> bulancontent = [
    BulanContent(bulan: "Maret", tahun: "2022"),
    BulanContent(bulan: "April", tahun: "2022"),
    BulanContent(bulan: "Mei", tahun: "2022"),
    BulanContent(bulan: "Juni", tahun: "2022"),
    BulanContent(bulan: "Juli", tahun: "2022"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Data Perbulan"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const TambahBulan())),
          child: const Icon(Icons.add)),
      body: Center(
        child: ListView.builder(
          itemCount: bulancontent.length,
          itemBuilder: (context, index) => Bulan(index: index),
        ),
      ),
    );
  }
}
