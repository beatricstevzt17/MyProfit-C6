import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:aplikasi/app/screen/hari/widgets/hari_widget.dart';
import 'package:flutter/material.dart';

import 'tambah_page.dart';

class HariPage extends StatelessWidget {
  const HariPage({Key? key, this.harian, required this.idRekap})
      : super(key: key);

  final List<DataHarian>? harian;
  final String idRekap;

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
        child: FutureBuilder<RekapModel>(
          future: RekapController().getRekapHari(idRekap),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              snapshot.data!.dataHarian
                  .sort((a, b) => b.tanggalBuat.compareTo(a.tanggalBuat));
              return ListView.builder(
                itemCount: snapshot.data!.dataHarian.length,
                itemBuilder: (context, index) =>
                    Hari(content: snapshot.data!.dataHarian[index]),
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
