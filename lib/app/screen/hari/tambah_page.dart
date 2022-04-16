import 'package:flutter/material.dart';

import 'hari.dart';

class TambahPage extends StatefulWidget {
  const TambahPage({Key? key}) : super(key: key);

  @override
  State<TambahPage> createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Laporan Penjualan"),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: const Text(
                        "Tanggal",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffD6E5FA),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: const Text(
                        "Pemasukan",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffD6E5FA),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: const Text(
                        "Pengeluaran",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffD6E5FA),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: const Text(
                        "Jumlah yang terjual",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffD6E5FA),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: const Text(
                        "Ulasan/Feedback",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffD6E5FA),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return const HariPage();
                      }),
                    );
                  },
                  child: const Text(
                    'Tambah Data',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
