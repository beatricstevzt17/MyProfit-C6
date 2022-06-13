import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../artikel/artikel.dart';
import '../bulan/bulan.dart';
import '../pengaturan/pengaturan.dart';
import '../stock/stock.dart';

class GrafikPage2 extends StatefulWidget {
  const GrafikPage2({Key? key}) : super(key: key);

  @override
  State<GrafikPage2> createState() => _GrafikPage2State();
}

class _GrafikPage2State extends State<GrafikPage2> {
  DateTime date = DateTime.now();

  int tempPend = 0;
  int tempPeng = 0;

  @override
  Widget build(BuildContext context) {
    final rekap = Provider.of<RekapController>(context);
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Grafik"),
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
      body: FutureBuilder(
          future: rekap.getRekapHari2(),
          builder: (_, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Text(
                    "Pendapatan",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(12, (index) {
                        int pend = rekap.dataPendapatan[index + 1];
                        int pend2 = rekap.dataPendapatan[index];
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              tempPend = rekap.dataPendapatan[1];
                            } else if (index == 1) {
                              tempPend = rekap.dataPendapatan[2];
                            } else if (index == 2) {
                              tempPend = rekap.dataPendapatan[3];
                            } else if (index == 3) {
                              tempPend = rekap.dataPendapatan[4];
                            } else if (index == 4) {
                              tempPend = rekap.dataPendapatan[5];
                            } else if (index == 5) {
                              tempPend = rekap.dataPendapatan[6];
                            } else if (index == 6) {
                              tempPend = rekap.dataPendapatan[7];
                            } else if (index == 7) {
                              tempPend = rekap.dataPendapatan[8];
                            } else if (index == 8) {
                              tempPend = rekap.dataPendapatan[9];
                            } else if (index == 9) {
                              tempPend = rekap.dataPendapatan[10];
                            } else if (index == 10) {
                              tempPend = rekap.dataPendapatan[11];
                            } else if (index == 11) {
                              tempPend = rekap.dataPendapatan[12];
                            }
                            if (index == 0) {
                              tempPeng = rekap.dataPengeluaran[1];
                            } else if (index == 1) {
                              tempPeng = rekap.dataPengeluaran[2];
                            } else if (index == 2) {
                              tempPeng = rekap.dataPengeluaran[3];
                            } else if (index == 3) {
                              tempPeng = rekap.dataPengeluaran[4];
                            } else if (index == 4) {
                              tempPeng = rekap.dataPengeluaran[5];
                            } else if (index == 5) {
                              tempPeng = rekap.dataPengeluaran[6];
                            } else if (index == 6) {
                              tempPeng = rekap.dataPengeluaran[7];
                            } else if (index == 7) {
                              tempPeng = rekap.dataPengeluaran[8];
                            } else if (index == 8) {
                              tempPeng = rekap.dataPengeluaran[9];
                            } else if (index == 9) {
                              tempPeng = rekap.dataPengeluaran[10];
                            } else if (index == 10) {
                              tempPeng = rekap.dataPengeluaran[11];
                            } else if (index == 11) {
                              tempPeng = rekap.dataPengeluaran[12];
                            }
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                (pend == 0)
                                    ? const SizedBox()
                                    : (pend2 == 0)
                                        ? const Text("0%")
                                        : Text((((pend - pend2) / pend2) * 100)
                                                .toStringAsFixed(1) +
                                            "%"),
                                Container(
                                  color: (date.month == index + 1)
                                      ? Colors.green
                                      : Colors.red,
                                  height: (pend == 0)
                                      ? 0
                                      : (pend / rekap.sumPendatapan) * 100,
                                  width: 15,
                                ),
                                Text(
                                  (index == 0)
                                      ? "Jan"
                                      : (index == 1)
                                          ? "Feb"
                                          : (index == 2)
                                              ? "Mar"
                                              : (index == 3)
                                                  ? "Apr"
                                                  : (index == 4)
                                                      ? "Mei"
                                                      : (index == 5)
                                                          ? "Jun"
                                                          : (index == 6)
                                                              ? "Jul"
                                                              : (index == 7)
                                                                  ? "Agu"
                                                                  : (index == 8)
                                                                      ? "Sep"
                                                                      : (index ==
                                                                              9)
                                                                          ? "Okt"
                                                                          : (index == 10)
                                                                              ? "Nov"
                                                                              : "Des",
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Pengeluaran",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(12, (index) {
                        int peng = rekap.dataPengeluaran[index + 1];
                        int peng2 = rekap.dataPengeluaran[index];
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              tempPend = rekap.dataPendapatan[1];
                            } else if (index == 1) {
                              tempPend = rekap.dataPendapatan[2];
                            } else if (index == 2) {
                              tempPend = rekap.dataPendapatan[3];
                            } else if (index == 3) {
                              tempPend = rekap.dataPendapatan[4];
                            } else if (index == 4) {
                              tempPend = rekap.dataPendapatan[5];
                            } else if (index == 5) {
                              tempPend = rekap.dataPendapatan[6];
                            } else if (index == 6) {
                              tempPend = rekap.dataPendapatan[7];
                            } else if (index == 7) {
                              tempPend = rekap.dataPendapatan[8];
                            } else if (index == 8) {
                              tempPend = rekap.dataPendapatan[9];
                            } else if (index == 9) {
                              tempPend = rekap.dataPendapatan[10];
                            } else if (index == 10) {
                              tempPend = rekap.dataPendapatan[11];
                            } else if (index == 11) {
                              tempPend = rekap.dataPendapatan[12];
                            }
                            if (index == 0) {
                              tempPeng = rekap.dataPengeluaran[1];
                            } else if (index == 1) {
                              tempPeng = rekap.dataPengeluaran[2];
                            } else if (index == 2) {
                              tempPeng = rekap.dataPengeluaran[3];
                            } else if (index == 3) {
                              tempPeng = rekap.dataPengeluaran[4];
                            } else if (index == 4) {
                              tempPeng = rekap.dataPengeluaran[5];
                            } else if (index == 5) {
                              tempPeng = rekap.dataPengeluaran[6];
                            } else if (index == 6) {
                              tempPeng = rekap.dataPengeluaran[7];
                            } else if (index == 7) {
                              tempPeng = rekap.dataPengeluaran[8];
                            } else if (index == 8) {
                              tempPeng = rekap.dataPengeluaran[9];
                            } else if (index == 9) {
                              tempPeng = rekap.dataPengeluaran[10];
                            } else if (index == 10) {
                              tempPeng = rekap.dataPengeluaran[11];
                            } else if (index == 11) {
                              tempPeng = rekap.dataPengeluaran[12];
                            }
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                (peng == 0)
                                    ? const SizedBox()
                                    : (peng2 == 0)
                                        ? const Text("0%")
                                        : Text((((peng - peng2) / peng2) * 100)
                                                .toStringAsFixed(1) +
                                            "%"),
                                Container(
                                  color: (date.month == index + 1)
                                      ? Colors.green
                                      : Colors.blue,
                                  height: (peng == 0)
                                      ? 0
                                      : (peng / rekap.sumPengeluaran) * 100,
                                  width: 15,
                                ),
                                Text(
                                  (index == 0)
                                      ? "Jan"
                                      : (index == 1)
                                          ? "Feb"
                                          : (index == 2)
                                              ? "Mar"
                                              : (index == 3)
                                                  ? "Apr"
                                                  : (index == 4)
                                                      ? "Mei"
                                                      : (index == 5)
                                                          ? "Jun"
                                                          : (index == 6)
                                                              ? "Jul"
                                                              : (index == 7)
                                                                  ? "Agu"
                                                                  : (index == 8)
                                                                      ? "Sep"
                                                                      : (index ==
                                                                              9)
                                                                          ? "Okt"
                                                                          : (index == 10)
                                                                              ? "Nov"
                                                                              : "Des",
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 50),
                  (tempPend == 0)
                      ? const SizedBox()
                      : Text("Pendapatan: " + tempPend.toString()),
                  (tempPeng == 0)
                      ? const SizedBox()
                      : Text("Pengeluaran: " + tempPeng.toString()),
                  (tempPend == 0 && tempPend == 0)
                      ? const SizedBox()
                      : Text("Laba: Rp " + ((tempPend - tempPeng)).toString()),
                ],
              ),
            );
          }),
    );
  }
}
