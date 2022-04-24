import 'package:flutter/material.dart';

//navigasi ke bulan (beranda)
import 'package:aplikasi/app/screen/bulan/bulan.dart';

//navigasi ke stock
import 'package:aplikasi/app/screen/stock/stock.dart';

//navigasi ke pengaturan
import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';

//navigasi ke artikel
import 'package:aplikasi/app/screen/artikel/artikel.dart';
import 'package:google_fonts/google_fonts.dart';

class GrafikPage extends StatelessWidget {
  const GrafikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9AD0EC),
          title: const Text("Grafik"),
        ),
        drawer: Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF9AD0EC)),
            child: Text(
              "MyProfit",
              style:
                  GoogleFonts.kaushanScript(fontSize: 50, color: Colors.white),
            ),
          ),
          //1.) Rekapan
          ListTile(
            title: const Text(
              "Rekapan",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BulanPage(),
              ),
            ),
          ),
          //2.) Stock Bahan
          ListTile(
            title: const Text("Stock Bahan",
                style: TextStyle(
                  fontSize: 15,
                )),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StockPage(),
              ),
            ),
          ),
          //3.) Grafik
          ListTile(
            title: const Text("Grafik",
                style: TextStyle(
                  fontSize: 15,
                )),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const GrafikPage(),
              ),
            ),
          ),
          //4.) Artikel
          ListTile(
            title: const Text("Artikel",
                style: TextStyle(
                  fontSize: 15,
                )),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ArtikelPage(),
              ),
            ),
          ),
          //5.) Pengaturan
          ListTile(
            title: const Text("Pengaturan",
                style: TextStyle(
                  fontSize: 15,
                )),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PengaturanPage(),
              ),
            ),
          ),
        ]),
      ),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        // body: TEMPAT NGODING,
      ),
    );
  }
}
