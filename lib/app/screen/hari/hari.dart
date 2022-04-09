import 'package:aplikasi/app/screen/hari/ubah_page.dart';
import 'package:flutter/material.dart';

import 'tambah_page.dart';

class HariPage extends StatefulWidget {
  const HariPage({Key? key}) : super(key: key);

  @override
  State<HariPage> createState() => _HariPageState();
}

class _HariPageState extends State<HariPage> {
  List<Map<String, dynamic>> data = [
    {"hari": "Rabu", "tanggal": "26/3/2022"},
    {"hari": "Kamis", "tanggal": "23/2/2022"},
    {"hari": "Senin", "tanggal": "20/2/2022"},
    {"hari": "Minggu", "tanggal": "20/1/2022"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Penjualan perhari"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const TambahPage())),
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
                        return const UbahPage();
                      }));
                    },
                    child: Center(
                        child: Text(
                      "${data[index]["hari"]} ${data[index]["tanggal"]}}",
                      style: const TextStyle(
                          fontSize: 15,
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

//hallo