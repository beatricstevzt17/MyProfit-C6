import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class RekapController {
  List<RekapModel> dataRekap = [];

  Future<void> getRekapBulan() async {
    final data =
        await FirebaseFirestore.instance.collection("rekapitulasi").get();
    dataRekap = <RekapModel>[
      for (QueryDocumentSnapshot<Map<String, dynamic>> item in data.docs)
        RekapModel(
          idRekap: item.data()["id_rekap"],
          tanggal: (item.data()["tanggal"] as Timestamp).toDate(),
          dataHarian: <DataHarian>[
            for (Map<String, dynamic> harian in item.data()["data_harian"])
              DataHarian(
                id: harian["id_harian"],
                pendapatan: harian["pendapatan"],
                pengeluaran: harian["pengeluaran"],
                jumlahTerjual: harian["jumlah_terjual"],
                tanggalBuat: (harian["tanggal_buat"] as Timestamp).toDate(),
                tanggalUbah: (harian["tanggal_ubah"] as Timestamp).toDate(),
              )
          ],
        )
    ];
  }

  Future<RekapModel> getRekapHari(String idHarian) async {
    final data = await FirebaseFirestore.instance
        .collection("rekapitulasi")
        .doc(idHarian)
        .get();
    return RekapModel(
      idRekap: idHarian,
      tanggal: ((data.data() as Map<String, dynamic>)["tanggal"] as Timestamp)
          .toDate(),
      dataHarian: <DataHarian>[
        for (Map<String, dynamic> item
            in (data.data() as Map<String, dynamic>)["data_harian"])
          DataHarian(
            id: item["id_harian"],
            pendapatan: item["pendapatan"],
            pengeluaran: item["pengeluaran"],
            jumlahTerjual: item["jumlah_terjual"],
            tanggalBuat: (item["tanggal_buat"] as Timestamp).toDate(),
            tanggalUbah: (item["tanggal_ubah"] as Timestamp).toDate(),
          )
      ],
    );
  }

  Future<void> insertRekap({DateTime? tanggal, int? pendapatan, int? pengeluaran, int? jumlahJual}) async {
    final data =
        await FirebaseFirestore.instance.collection("rekapitulasi").get();
    final month = FirebaseFirestore.instance.collection("rekapitulasi").doc();
    for (QueryDocumentSnapshot<Map<String, dynamic>> item in data.docs) {
      if (DateFormat("MMM").format((item.data()["tanggal"] as Timestamp).toDate()) == DateFormat("MMM").format(tanggal!)) {
        final doc = FirebaseFirestore.instance
            .collection("rekapitulasi")
            .doc(item.data()["id_rekap"]);
        await doc.update(
          {
            "data_harian": FieldValue.arrayUnion(
              [
                {
                  "id_harian": "dw11w",
                  "pendapatan": pendapatan,
                  "pengeluaran": pengeluaran,
                  "jumlah_terjual": jumlahJual,
                  "tanggal_buat": tanggal,
                  "tanggal_ubah": tanggal,
                }
              ],
            )
          },
        );
        return;
      }
    }
    await month.set({
      "id_rekap": month.id,
      "tanggal": tanggal,
      "data_harian": [],
    });
    await month.update(
      {
        "data_harian": FieldValue.arrayUnion(
          [
            {
              "id_harian": "dw11w",
              "pendapatan": pendapatan,
              "pengeluaran": pengeluaran,
              "jumlah_terjual": jumlahJual,
              "tanggal_buat": tanggal,
              "tanggal_ubah": tanggal,
            }
          ],
        )
      },
    );
  }
}
