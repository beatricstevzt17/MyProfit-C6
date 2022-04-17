import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:aplikasi/app/screen/loading/loading.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../controllers/rekap_controller.dart';

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
  RekapController rekap = RekapController();
  DateTime selectedDate = DateTime.now();

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(DateFormat("EEEE, dd/MM/yyyy")
                                    .format(selectedDate))),
                            IconButton(
                                onPressed: () => selectDate(context),
                                icon: Image.asset("assets/icons/calendar.png"))
                          ],
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
                        padding: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          color: Color(0xffD6E5FA),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          keyboardType: TextInputType.number,
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
                          "Pengeluaran",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          color: Color(0xffD6E5FA),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          keyboardType: TextInputType.number,
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
                          "Jumlah yang terjual",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          color: Color(0xffD6E5FA),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          keyboardType: TextInputType.number,
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
                          "Ulasan/Feedback",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
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
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (_) => const CustomLoading());
                      await Future.delayed(const Duration(seconds: 2));
                      await rekap.insertRekap(
                        tanggal: selectedDate,
                        pendapatan: int.parse(controller1.text),
                        pengeluaran: int.parse(controller2.text),
                        jumlahJual: int.parse(controller3.text),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BulanPage()),
                        (route) => false,
                      ).then((value) => setState(() {
                            rekap.getRekapBulan();
                          }));
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
      ),
    );
  }
}
