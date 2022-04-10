import 'package:aplikasi/app/screen/bulan/tambahbulan.dart';
import 'package:aplikasi/app/screen/hari/hari.dart';
import 'package:aplikasi/app/screen/hari/ubah_page.dart';
import 'package:flutter/material.dart';

class BulanPage extends StatefulWidget {
  const BulanPage({Key? key}) : super(key: key);

  @override
  State<BulanPage> createState() => _BulanPageState();
}

class _BulanPageState extends State<BulanPage> {
  List<Map<String, dynamic>> data = [
    {"bulan": "Desember", "tahun": "2021"},
    {"bulan": "Januari", "tahun": "2022"},
    {"bulan": "Februari", "tahun": "2022"},
    {"bulan": "Maret", "tahun": "2022"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Perbulan"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const TambahBulan())),
          child: const Icon(Icons.add)),
      body: Center(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(0xFF9AD0EC),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: const Color(0xFFD6E5FA),
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const HariPage();
                      }));
                    },
                    child: Center(
                        child: Text(
                      "${data[index]["bulan"]} ${data[index]["tahun"]}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
