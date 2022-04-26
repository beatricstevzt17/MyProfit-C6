import 'dart:developer';

import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class RekapController {
  List<RekapModel> dataRekap = [];

  //METHOD AMBIL DATA BULAN
  Future<void> getRekapBulan() async {
    final data =
        await FirebaseFirestore.instance.collection("rekapitulasi").get();
    dataRekap = <RekapModel>[
      for (QueryDocumentSnapshot<Map<String, dynamic>> item in data.docs)
        RekapModel.fromJson(item.data())
    ];
  }

  //METHOD AMBIL DATA HARIAN
  Future<List<DataHarian>> getRekapHari({String? idRekap}) async {
    final data = await FirebaseFirestore.instance
        .collection("rekapitulasi_harian")
        .where("id_rekap", isEqualTo: idRekap)
        .get();
    return <DataHarian>[
      for (DocumentSnapshot<Map<String, dynamic>> item in data.docs)
        DataHarian.fromJson(item.data()!)
    ];
  }

  //METHOD UBAH DATA
  Future<void> ubahRekap({
    DateTime? tanggal,
    int? pendapatan,
    int? pengeluaran,
    int? jumlahJual,
    String? idRekap,
    String? ulasan,
    String? idHarian,
  }) async {
    final harian = FirebaseFirestore.instance
        .collection("rekapitulasi_harian")
        .doc(idHarian);

    await harian.set({
      "id_harian": idHarian,
      "id_rekap": idRekap,
      "pendapatan": pendapatan,
      "pengeluaran": pengeluaran,
      "jumlah_terjual": jumlahJual,
      "ulasan": ulasan,
      "tanggal_buat": tanggal,
      "tanggal_ubah": tanggal,
    });
  }

  //METHOD TAMBAH DATA
  Future<void> insertRekap({
    DateTime? tanggal,
    int? pendapatan,
    int? pengeluaran,
    int? jumlahJual,
    String? idRekap,
    String? ulasan,
  }) async {
    final harian =
        FirebaseFirestore.instance.collection("rekapitulasi_harian").doc();

    await harian.set({
      "id_harian": harian.id,
      "id_rekap": idRekap,
      "pendapatan": pendapatan,
      "pengeluaran": pengeluaran,
      "jumlah_terjual": jumlahJual,
      "ulasan": ulasan,
      "tanggal_buat": tanggal,
      "tanggal_ubah": tanggal,
    });
  }

  //METHOD DELETE
  Future<void> deleteRekap({String? idHarian}) async {
    await FirebaseFirestore.instance
        .collection("rekapitulasi_harian")
        .doc(idHarian)
        .delete();
  }

  //METHOD UPLOAD PROFILE
  Future<void> fotoProfile(String nama, String telepon) async {
    await FirebaseFirestore.instance.collection("rekapitulasi").get();
    final profile =
        FirebaseFirestore.instance.collection("rekapitulasi_harian").doc();
    await profile.update({
      "nama" : nama,
      "telepon" : telepon,
    });
  }
}
