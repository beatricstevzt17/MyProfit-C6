import 'package:cloud_firestore/cloud_firestore.dart';

class RekapModel {
  RekapModel({
    required this.idRekap,
    required this.tanggal,
  });

  final String idRekap;
  final DateTime tanggal;

  factory RekapModel.fromJson(Map<String, dynamic> json) => RekapModel(
        idRekap: json["id_rekap"],
        tanggal: (json["tanggal"] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        "id_rekap": idRekap,
        "tanggal": tanggal,
      };
}

class DataHarian {
  DataHarian({
    required this.id,
    required this.idRekap,
    required this.pendapatan,
    required this.pengeluaran,
    required this.jumlahTerjual,
    required this.tanggalBuat,
    required this.tanggalUbah,
    required this.ulasan,
  });

  final String idRekap;
  final String id;
  final int pendapatan;
  final int pengeluaran;
  final int jumlahTerjual;
  final DateTime tanggalBuat;
  final DateTime tanggalUbah;
  final String ulasan;

  factory DataHarian.fromJson(Map<String, dynamic> json) => DataHarian(
        id: json["id_harian"],
        idRekap: json["id_rekap"],
        pendapatan: json["pendapatan"],
        pengeluaran: json["pengeluaran"],
        jumlahTerjual: json["jumlah_terjual"],
        ulasan: json["ulasan"],
        tanggalBuat: (json["tanggal_buat"] as Timestamp).toDate(),
        tanggalUbah: (json["tanggal_ubah"] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_rekap": idRekap,
        "pendapatan": pendapatan,
        "pengeluaran": pengeluaran,
        "jumlah_terjual": jumlahTerjual,
        "tanggal_buat": tanggalBuat,
        "tanggal_ubah": tanggalUbah,
        "ulasan": ulasan,
      };
}
