import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//models
import 'package:aplikasi/app/models/stock_models.dart';

//parent
import 'package:aplikasi/app/screen/stock/stock.dart';

class UpdateStock extends StatelessWidget {
  const UpdateStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9AD0EC),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (_) => StockPage(),
              ),
            ),
            tooltip: "Back",
          ),
          title: const Text("Ubah Stok Bahan"),
        ),
//////////////////////////////////////////// TEXT FIELD /////////////////////////////////////////
        // body: ,
      ),
    );
  }
}
