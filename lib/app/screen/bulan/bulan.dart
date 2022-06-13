import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:aplikasi/app/screen/grafik/grafik2.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//navigasi ke pengaturan
import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';

//navigasi ke grafik

//navigasi ke artikel
import 'package:aplikasi/app/screen/artikel/artikel.dart';

//navigasi ke stock
import 'package:aplikasi/app/screen/stock/stock.dart';

//navigasi ke bulan
import 'package:aplikasi/app/screen/bulan/widgets/konten_bulan.dart';

//fab
import 'package:aplikasi/app/screen/hari/tambah_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BulanPage extends StatefulWidget {
  const BulanPage({Key? key}) : super(key: key);

  @override
  State<BulanPage> createState() => _BulanPageState();
}

class _BulanPageState extends State<BulanPage> {
  bool isAsc = false;

  @override
  Widget build(BuildContext context) {
    final rekap = Provider.of<RekapController>(context);
    final user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      floatingActionButton: (user.getUser.isOwner)
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TambahPage()))),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: Text(
          "MyProfit",
          style: GoogleFonts.kaushanScript(fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Urutkan: ",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    isAsc = !isAsc;
                    setState(() {});
                  },
                  child: const Text("A - Z"),
                  style: ElevatedButton.styleFrom(
                    primary: isAsc
                        ? const Color(0xFF4EB9EF)
                        : const Color(0xFF9AD0EC),
                    elevation: 0,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    isAsc = !isAsc;
                    setState(() {});
                  },
                  child: const Text("Z - A"),
                  style: ElevatedButton.styleFrom(
                    primary: isAsc
                        ? const Color(0xFF9AD0EC)
                        : const Color(0xFF4EB9EF),
                    elevation: 0,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            FutureBuilder(
              future: rekap.getRekapBulan(),
              builder: (_, snapshot) {
                if (rekap.dataRekap.isEmpty) {
                  return const SizedBox();
                }
                if (rekap.dataRekap.isNotEmpty) {
                  if (isAsc) {
                    final data = rekap.dataRekap;
                    data.sort((a, b) => a.tanggal.compareTo(b.tanggal));
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (_, index) {
                          return Bulan(content: data[index]);
                        },
                      ),
                    );
                  } else if (!isAsc) {
                    final data = rekap.dataRekap;
                    data.sort((a, b) => b.tanggal.compareTo(a.tanggal));
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (_, index) {
                          return Bulan(content: data[index]);
                        },
                      ),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
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
    );
  }
}
