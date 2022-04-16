import 'package:flutter/material.dart';

//memanggil kerangka bulan :

class Bulan extends StatelessWidget {
  const Bulan({required this.index, Key? key}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.1,
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
          child: Row(
            children: <Widget>[
              //konten ke 1 : ROW (icon & text bulan)
              Row(
                children: <Widget>[],
              )
            ],
          ),
        ),
      ),
    );
  }
}
