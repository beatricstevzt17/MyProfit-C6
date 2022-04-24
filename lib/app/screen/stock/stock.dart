import 'package:google_fonts/google_fonts.dart';
import 'package:aplikasi/app/models/stock_models.dart';
import 'package:flutter/material.dart';

//navigasi ke child (StockWidget)
import 'package:aplikasi/app/screen/stock/widgets/stock_widget.dart';

//navigasi ke tambah stock
import 'package:aplikasi/app/screen/stock/widgets/tambah_stock.dart';

//navigasi ke bulan (beranda)
import 'package:aplikasi/app/screen/bulan/bulan.dart';

//navigasi ke bulan (artikel)
import 'package:aplikasi/app/screen/artikel/artikel.dart';

//navigasi ke bulan (grafik)
import 'package:aplikasi/app/screen/grafik/grafik.dart';

//navigasi ke bulan (pengaturan)
import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';

class StockPage extends StatelessWidget {
  StockPage({Key? key}) : super(key: key);
  final List<StockContent> stokkonten = [
    StockContent(
        gambar:
            "https://images.bisnis-cdn.com/thumb/posts/2021/10/08/1452169/tepung-terigu.jpg?w=600&h=400",
        nama: "Tepung",
        jumlah: "Jumlah : 3"),
    StockContent(
        gambar:
            "https://risetcdn.jatimtimes.com/images/2022/01/10/Buah-naga-merah-Foto-tuliu.com-P182e54964932ed8c.jpg",
        nama: "Buah Naga",
        jumlah: "Jumlah : 3"),
    StockContent(
        gambar:
            "https://res.cloudinary.com/dk0z4ums3/image/upload/v1594114160/attached_image/ketahui-kelebihan-dan-kekurangan-telur-bebek.jpg",
        nama: "Telur Bebek",
        jumlah: "Jumlah : 3")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TambahStock(),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF9AD0EC),
          title: const Text("Stock Bahan"),
        ),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF9AD0EC)),
              child: Text(
                "MyProfit",
                style: GoogleFonts.kaushanScript(
                    fontSize: 50, color: Colors.white),
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
        body: ListView.builder(
            itemCount: stokkonten.length,
            itemBuilder: (context, index) =>
                StockWidget(konten: stokkonten[index])),
      ),
    );
  }
}
