import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:aplikasi/app/screen/hari/hari.dart';
import 'package:aplikasi/app/screen/loading/loading.dart';
import 'package:flutter/material.dart';

//memanggil kerangka bulan :
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Bulan extends StatelessWidget {
  const Bulan({required this.content, Key? key}) : super(key: key);

  final RekapModel content;

  @override
  Widget build(BuildContext context) {
    final rekap = Provider.of<RekapController>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: const BoxDecoration(),
      //agar bisa di klik :
      child: GestureDetector(
        onTap: (() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HariPage(
                    idRekap: content.idRekap, dateTime: content.tanggal),
              ),
            )),
        child: Card(
          child: Row(
            children: <Widget>[
              //a) Icon
              Transform.scale(
                scale: 0.5,
                child: Image.asset("assets/icons/calendar.png"),
              ),
              //b) text bulan
              Text(
                DateFormat("MMMM yyyy", "in_ID").format(content.tanggal),
                style: const TextStyle(fontSize: 20),
              ),
              (context.read<UserProvider>().getUser.isOwner)
                  ? const SizedBox()
                  : Transform.scale(
                      scale: 0.7,
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => AlertDialog(
                                title: const Text("Perhatian!"),
                                content: Text(
                                  "Apakah anda yakin ingin menghapus rekap ${DateFormat('MMMM').format(content.tanggal)} ${content.tanggal.year}",
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
                                          builder: (_) =>
                                              const CustomLoading());
                                      rekap
                                          .deleteRekapBulanan(
                                              rekapId: content.idRekap)
                                          .then(
                                        (value) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const BulanPage()),
                                            (route) => false,
                                          );
                                        },
                                      );
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
