import 'dart:developer';

import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:aplikasi/app/screen/hari/widgets/hari_widget.dart';
import 'package:flutter/material.dart';

import 'tambah_page.dart';

class HariPage extends StatelessWidget {
  const HariPage({Key? key, required this.idRekap, required this.dateTime})
      : super(key: key);

  final String idRekap;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    RekapController rekap = RekapController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Laporan Penjualan perhari"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => TambahPage(
                        idRekap: idRekap,
                        dateTime: dateTime,
                      )))),
      body: Center(
        child: FutureBuilder<List<DataHarian>>(
          future: rekap.getRekapHari(idRekap: idRekap),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              snapshot.data!
                  .sort((a, b) => b.tanggalBuat.compareTo(a.tanggalBuat));

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) =>
                    Hari(content: snapshot.data![index], idRekap: idRekap),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
