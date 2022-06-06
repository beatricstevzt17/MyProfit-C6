import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:aplikasi/app/screen/hari/ubah_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../loading/loading.dart';

//memanggil kerangka hari :
// import '../bulan.dart';

class Hari extends StatelessWidget {
  const Hari({required this.idRekap, required this.content, Key? key})
      : super(key: key);

  final DataHarian content;
  final String idRekap;

  @override
  Widget build(BuildContext context) {
    RekapController rekap = RekapController();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      //agar bisa di klik :
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UbahPage(content: content, idRekap: idRekap),
                ),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //1) konten ke 1 : ROW (icon & text bulan)
              Row(
                children: <Widget>[
                  //a) Icon
                  Transform.scale(
                    scale: 0.5,
                    child: Image.asset("assets/icons/dollar.png"),
                  ),
                  //b) text bulan
                  Text(
                    DateFormat("EEEE, dd MM yyyy", "in_ID")
                        .format(content.tanggalBuat),
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              //2) konten 2 : icon delete
              Transform.scale(
                scale: 0.7,
                child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => AlertDialog(
                          title: const Text("Perhatian!"),
                          content: Text(
                            "Apakah anda yakin ingin menghapus rekap ${DateFormat('d').format(content.tanggalBuat)} ${DateFormat('MMMM').format(content.tanggalBuat)} ${content.tanggalBuat.year}",
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Tidak"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => const CustomLoading());
                                rekap.deleteRekap(idHarian: content.id);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text("Ya"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Image.asset("assets/icons/delete.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
