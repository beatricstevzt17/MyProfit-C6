import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:aplikasi/app/screen/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  late DateTime selectedDate;

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      setState(() {});
    }
  }

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9AD0EC),
          title: const Text("Laporan Penjualan"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 2, 10, 5),
                          child: const Text(
                            "Tanggal",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xffD6E5FA),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                      DateFormat("EEEE, dd/MM/yyyy", "in_ID")
                                          .format(selectedDate))),
                              IconButton(
                                  onPressed: () => selectDate(context),
                                  icon:
                                      Image.asset("assets/icons/calendar.png"))
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
                        TextField(
                          decoration: InputDecoration(
                            prefix: const Text(
                              "Rp ",
                              style: TextStyle(color: Colors.black),
                            ),
                            contentPadding: const EdgeInsets.all(15),
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color(0xffD6E5FA),
                          ),
                          keyboardType: TextInputType.number,
                          controller: controller1,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                          ],
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
                        TextField(
                          decoration: InputDecoration(
                            prefix: const Text(
                              "Rp ",
                              style: TextStyle(color: Colors.black),
                            ),
                            contentPadding: const EdgeInsets.all(15),
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color(0xffD6E5FA),
                          ),
                          keyboardType: TextInputType.number,
                          controller: controller2,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                          ],
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
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color(0xffD6E5FA),
                          ),
                          keyboardType: TextInputType.number,
                          controller: controller3,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                          ],
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
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: double.infinity,
                            maxWidth: double.infinity,
                            minHeight: 25.0,
                            maxHeight: 135.0,
                          ),
                          child: Scrollbar(
                            child: TextField(
                              controller: controller4,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: const Color(0xffD6E5FA),
                                filled: true,
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.all(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //BUTTON TAMBAH DATA : ADD KE FIREBASE & BALIK KE BERANDA
                    ElevatedButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (_) => const CustomLoading());
                        await rekap.insertRekap(
                          tanggal: selectedDate,
                          pendapatan: int.parse(controller1.text),
                          pengeluaran: int.parse(controller2.text),
                          ulasan: controller4.text,
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
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Tambah Data',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}