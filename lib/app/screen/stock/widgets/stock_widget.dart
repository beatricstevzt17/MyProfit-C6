import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//models
import 'package:aplikasi/app/models/stock_models.dart';

//tambah stock

//ubah stock
import 'package:aplikasi/app/screen/stock/widgets/update_stock.dart';

class StockWidget extends StatelessWidget {
  const StockWidget({required this.konten, Key? key}) : super(key: key);
  
  final StockModel konten;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width * 2,
      // height: MediaQuery.of(context).size.height * 0.1,
      color: const Color(0xA9B2E5FF),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => UpdateStock(
                      konten: konten,
                    )
                // (content2: content),
                ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //1) container utk gambar
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(konten.gambar), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              //2) column utk nama item & jumlah
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //a) nama item
                  Text(
                    konten.namaItem,
                    style: GoogleFonts.openSans(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  //b) jumlah
                  Text(
                    konten.jumlah + " kg",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
