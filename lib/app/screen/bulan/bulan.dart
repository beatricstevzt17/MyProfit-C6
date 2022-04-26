import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/screen/bulan/tambahbulan.dart';
import 'package:flutter/material.dart';

//navigasi ke pengaturan
import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';

//navigasi ke grafik
import 'package:aplikasi/app/screen/grafik/grafik.dart';

//navigasi ke artikel
import 'package:aplikasi/app/screen/artikel/artikel.dart';

//navigasi ke stock
import 'package:aplikasi/app/screen/stock/stock.dart';
import 'package:aplikasi/app/models/stock_models.dart';

//navigasi ke bulan
import 'package:aplikasi/app/screen/bulan/widgets/konten_bulan.dart';

//fab
import 'package:aplikasi/app/screen/hari/tambah_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BulanPage extends StatefulWidget {
  const BulanPage({Key? key}) : super(key: key);

  @override
  State<BulanPage> createState() => _BulanPageState();
}

class _BulanPageState extends State<BulanPage> {
  RekapController rekap = RekapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TambahBulan(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: Text(
          "MyProfit",
          style: GoogleFonts.kaushanScript(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                rekap.getRekapBulan();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: rekap.getRekapBulan(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final data = rekap.dataRekap;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return Bulan(content: data[index]);
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
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
                builder: (_) =>  GrafikPage(),
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
    );
  }
}
