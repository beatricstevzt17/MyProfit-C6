import 'dart:developer';

import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class RekapController with ChangeNotifier {
  List<RekapModel> dataRekap = [];

  //METHOD AMBIL DATA BULAN
  Future<void> getRekapBulan() async {
    final data =
        await FirebaseFirestore.instance.collection("rekapitulasi").get();
    dataRekap = <RekapModel>[
      for (QueryDocumentSnapshot<Map<String, dynamic>> item in data.docs)
        RekapModel.fromJson(item.data())
    ];

    notifyListeners();
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

  List<DataHarian>? _dataHarian;
  
  List<DataHarian> desB = [];
  List<DataHarian> jan = [];
  List<DataHarian> feb = [];
  List<DataHarian> mar = [];
  List<DataHarian> apr = [];
  List<DataHarian> mei = [];
  List<DataHarian> jun = [];
  List<DataHarian> jul = [];
  List<DataHarian> agu = [];
  List<DataHarian> sep = [];
  List<DataHarian> okt = [];
  List<DataHarian> nov = [];
  List<DataHarian> des = [];

  List<int> dataPendapatan = List.generate(13, (_) => 0);
  List<int> dataPengeluaran = List.generate(13, (_) => 0);
  int sumPendatapan = 0;
  int sumPengeluaran = 0;

  Future<void> getRekapHari2() async {
    final data = await FirebaseFirestore.instance
        .collection("rekapitulasi_harian")
        .get();
    setDataHarian = <DataHarian>[
      for (var i in data.docs) DataHarian.fromJson(i.data())
    ];
    sumPendatapan = getDataHarian!.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    sumPengeluaran = getDataHarian!.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    desB = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2021 && element.tanggalBuat.month == 12)
        .toList();
    dataPendapatan[0] = desB.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[0] = desB.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    jan = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 1)
        .toList();
    dataPendapatan[1] = jan.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[1] = jan.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    feb = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 2)
        .toList();
    dataPendapatan[2] = feb.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[2] = feb.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    mar = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 3)
        .toList();
    dataPendapatan[3] = mar.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[3] = mar.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    apr = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 4)
        .toList();
    dataPendapatan[4] = apr.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[4] = apr.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    mei = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 5)
        .toList();
    dataPendapatan[5] = mei.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[5] = mei.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    jun = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 6)
        .toList();
    dataPendapatan[6] = jun.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[6] = jun.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    jul = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 7)
        .toList();
    dataPendapatan[7] = jul.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[7] = jul.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    agu = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 8)
        .toList();
    dataPendapatan[8] = agu.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[8] = agu.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    sep = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 9)
        .toList();
    dataPendapatan[9] = sep.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[9] = sep.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    okt = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 10)
        .toList();
    dataPendapatan[10] = okt.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[10] = okt.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    nov = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 11)
        .toList();
    dataPendapatan[11] = nov.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[11] = nov.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
    des = getDataHarian!
        .where((element) =>
            element.tanggalBuat.year == 2022 && element.tanggalBuat.month == 12)
        .toList();
    dataPendapatan[12] = des.fold(0, (previousValue, element) => previousValue + element.pendapatan);
    dataPengeluaran[12] = des.fold(0, (previousValue, element) => previousValue + element.pengeluaran);
  }

  set setDataHarian(List<DataHarian> val) {
    _dataHarian = val;
    notifyListeners();
  }

  List<DataHarian>? get getDataHarian => _dataHarian;

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
      "nama": nama,
      "telepon": telepon,
    });
  }

//////////////////////////////////////////////// GRAFIK //////////////////////////////////////
  //METHOD AMBIL DATA HARIAN UNTUK GRAFIK
  Future<List<DataHarian>> getRekapGrafik() async {
    final data = await FirebaseFirestore.instance
        .collection("rekapitulasi_harian")
        .get();
    return <DataHarian>[
      for (DocumentSnapshot<Map<String, dynamic>> item in data.docs)
        DataHarian.fromJson(item.data()!)
    ];
  }
}
