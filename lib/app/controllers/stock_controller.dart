
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/stock_models.dart';

class StockController {
  List<StockModel> dataStok = [];

  //METHOD AMBIL DATA STOCK (GET)
  Future<void> getStock() async {
    final data = await FirebaseFirestore.instance.collection("stok").get();
    dataStok = <StockModel>[
      for (QueryDocumentSnapshot<Map<String, dynamic>> item in data.docs)
        StockModel.fromJson(item.data())
    ];
  }

  //METHOD UBAH DATA
  Future<void> ubahStock({
    String? idStock,
    String? jumlah,
    String? namaItem,

  }) async {
    final harian = FirebaseFirestore.instance
        .collection("stok")
        .doc(idStock);

    await harian.update({
      "jumlah": jumlah,
      "nama_item": namaItem,
     
    });
  }
}
