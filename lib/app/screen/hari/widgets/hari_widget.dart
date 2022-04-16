import 'package:aplikasi/app/models/hari_models.dart';
import 'package:aplikasi/app/screen/hari/ubah_page.dart';
import 'package:flutter/material.dart';

//memanggil kerangka hari :
// import '../bulan.dart';

class Hari extends StatelessWidget {
  const Hari({required this.content, Key? key}) : super(key: key);

  final HariContent content;

  @override
  Widget build(BuildContext context) {
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
                  builder: (_) => const UbahPage(),
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
                    content.tanggal,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              //2) konten 2 : icon delete
              Transform.scale(
                scale: 0.7,
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/icons/delete.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
