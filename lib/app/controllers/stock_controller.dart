import 'dart:developer';

import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
}
