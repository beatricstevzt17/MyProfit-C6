
import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:aplikasi/app/screen/hari/widgets/hari_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HariPage extends StatelessWidget {
  const HariPage({Key? key, required this.idRekap, required this.dateTime})
      : super(key: key);

  final String idRekap;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Laporan Penjualan perhari"),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("rekapitulasi_harian")
              .where("id_rekap", isEqualTo: idRekap)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final rekapModel = <DataHarian>[
                for (QueryDocumentSnapshot item in snapshot.data!.docs)
                  DataHarian.fromJson(item.data() as Map<String, dynamic>)
              ];
              rekapModel.sort((a, b) => b.tanggalBuat.compareTo(a.tanggalBuat));

              return ListView.builder(
                itemCount: rekapModel.length,
                itemBuilder: (context, index) =>
                    Hari(content: rekapModel[index], idRekap: idRekap),
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
