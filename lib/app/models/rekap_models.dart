import 'package:cloud_firestore/cloud_firestore.dart';

class RekapModel {
  RekapModel({
    required this.idRekap,
    required this.tanggal,
    required this.dataHarian,
  });

  final String idRekap;
  final DateTime tanggal;
  final List<DataHarian> dataHarian;

  factory RekapModel.fromJson(Map<String, dynamic> json) => RekapModel(
        idRekap: json["id_rekap"],
        tanggal: (json["tanggal"] as Timestamp).toDate(),
        dataHarian: List<DataHarian>.from(
            json["data_harian"].map((x) => DataHarian.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_rekap": idRekap,
        "tanggal": tanggal,
        "data_harian": List<dynamic>.from(dataHarian.map((x) => x.toJson())),
      };
}

class DataHarian {
  DataHarian({
    required this.id,
    required this.pendapatan,
    required this.pengeluaran,
    required this.jumlahTerjual,
    required this.tanggalBuat,
    required this.tanggalUbah,
    required this.ulasan,
  });

  final String id;
  final int pendapatan;
  final int pengeluaran;
  final int jumlahTerjual;
  final DateTime tanggalBuat;
  final DateTime tanggalUbah;
  final String ulasan;

  factory DataHarian.fromJson(Map<String, dynamic> json) => DataHarian(
        id: json["id"],
        pendapatan: json["pendapatan"],
        pengeluaran: json["pengeluaran"],
        jumlahTerjual: json["ulasan"],
        ulasan: json["jumlah_terjual"],
        tanggalBuat: (json["tanggal_buat"] as Timestamp).toDate(),
        tanggalUbah: (json["tanggal_ubah"] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pendapatan": pendapatan,
        "pengeluaran": pengeluaran,
        "jumlah_terjual": jumlahTerjual,
        "tanggal_buat": tanggalBuat,
        "tanggal_ubah": tanggalUbah,
        "ulasan": ulasan
        ,
      };
}
