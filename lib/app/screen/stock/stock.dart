import 'package:aplikasi/app/controllers/stock_controller.dart';
import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:aplikasi/app/screen/grafik/grafik2.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

//navigasi ke child (StockWidget)
import 'package:aplikasi/app/screen/stock/widgets/stock_widget.dart';

//navigasi ke tambah stock

//navigasi ke bulan (beranda)
import 'package:aplikasi/app/screen/bulan/bulan.dart';

//navigasi ke bulan (artikel)
import 'package:aplikasi/app/screen/artikel/artikel.dart';

//navigasi ke bulan (grafik)

//navigasi ke bulan (pengaturan)
import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';
import 'package:provider/provider.dart';

class StockPage extends StatefulWidget {
  const StockPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  late StockController _stockController;
  @override
  void initState() {
    _stockController = StockController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => const TambahStock(),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Stock Bahan"),
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 115, 188, 224)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MyProfit",
                  style: GoogleFonts.kaushanScript(
                      fontSize: 45, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: user.getUser.image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.getUser.username,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          (user.getUser.isOwner) ? "Owner" : "Admin",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          //1.) Rekapan
          ListTile(
            leading: const Icon(
              Icons.note_alt_outlined,
              color: Color.fromARGB(255, 94, 157, 188),
            ),
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
            leading: const Icon(
              Icons.category_outlined,
              color: Color.fromARGB(255, 94, 157, 188),
            ),
            title: const Text("Stock Bahan",
                style: TextStyle(
                  fontSize: 15,
                )),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const StockPage(),
              ),
            ),
          ),
          //3.) Grafik
          ListTile(
            leading: const Icon(
              Icons.bar_chart,
              color: Color.fromARGB(255, 94, 157, 188),
            ),
            title: const Text("Grafik",
                style: TextStyle(
                  fontSize: 15,
                )),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const GrafikPage2(),
              ),
            ),
          ),
          //4.) Artikel
          ListTile(
            leading: const Icon(
              Icons.article_outlined,
              color: Color.fromARGB(255, 94, 157, 188),
            ),
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
            leading: const Icon(
              Icons.settings_outlined,
              color: Color.fromARGB(255, 94, 157, 188),
            ),
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
      body: FutureBuilder(
        future: _stockController.getStock(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          return ListView.builder(
            itemCount: _stockController.dataStok.length,
            itemBuilder: (context, index) => StockWidget(
              konten: _stockController.dataStok[index],
            ),
          );
        },
      ),
    );
  }
}
