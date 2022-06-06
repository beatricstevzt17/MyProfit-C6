import 'package:flutter/material.dart';
import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:aplikasi/app/screen/bulan/bulan.dart';

import '../../controllers/rekap_controller.dart';

//utk dateformat
import 'package:intl/intl.dart';

import '../loading/loading.dart';

class UbahPage extends StatefulWidget {
  const UbahPage({required this.idRekap, required this.content, Key? key})
      : super(key: key);
  //1)
  final DataHarian content;
  final String idRekap;

  @override
  State<UbahPage> createState() => _UbahPageState();
}

//2) memesan variabel controler1,2,3,4, dan akan berjalan ketika page ubah data dibuka
class _UbahPageState extends State<UbahPage> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;
  late DateTime selectedDate;

//3) inisialisasi variabel "rekap" yg membungkus RekapController
  RekapController rekap = RekapController();

//4) inisialisasi controller1,2,3,4 utk read (mengambil data dr firebase)
  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();

    controller1.text = widget.content.pendapatan.toString();
    controller2.text = widget.content.pengeluaran.toString();
    controller3.text = widget.content.jumlahTerjual.toString();
    controller4.text = widget.content.ulasan;

    //agar me-return tanggal sesuai tangal buat pd saat itu
    selectedDate = widget.content.tanggalBuat;
    super.initState();
  }

  //function utk date picker (milih tanggal)
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

  //agar hemat memory
  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

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
                        decoration: const BoxDecoration(
                          color: Color(0xffD6E5FA),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          keyboardType: TextInputType.number,
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
                        decoration: const BoxDecoration(
                          color: Color(0xffD6E5FA),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          keyboardType: TextInputType.number,
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
                        decoration: const BoxDecoration(
                          color: Color(0xffD6E5FA),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          keyboardType: TextInputType.number,
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
                        decoration: const BoxDecoration(
                          color: Color(0xffD6E5FA),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
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
                      await Future.delayed(const Duration(seconds: 1));
                      await rekap.ubahRekap(
                        idHarian: widget.content.id,
                        tanggal: selectedDate,
                        pendapatan: int.parse(controller1.text),
                        pengeluaran: int.parse(controller2.text),
                        ulasan: controller4.text,
                        jumlahJual: int.parse(controller3.text),
                        idRekap: widget.idRekap,
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BulanPage()),
                        (route) => false,
                      ).then(
                        (value) => setState(() {
                          rekap.getRekapBulan();
                        }),
                      );
                    },
                    child: const Text(
                      'Ubah Data',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
