import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/app/screen/bulan/tambahbulan.dart';

//utk konten Bulan
import 'package:aplikasi/app/screen/bulan/widgets/konten_bulan.dart';

class BulanPage extends StatefulWidget {
  const BulanPage({Key? key}) : super(key: key);

  @override
  State<BulanPage> createState() => _BulanPageState();
}

class _BulanPageState extends State<BulanPage> {
  RekapController rekap = RekapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Data Perbulan"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                rekap.getRekapBulan();
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TambahBulan(),
                ),
              ),
          child: const Icon(Icons.add)),
      body: Center(
        child: FutureBuilder(
          future: rekap.getRekapBulan(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final data = rekap.dataRekap;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return Bulan(content: data[index]);
                },
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
