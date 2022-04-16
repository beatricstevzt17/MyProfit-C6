import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:flutter/material.dart';

class TambahBulan extends StatefulWidget {
  const TambahBulan({Key? key}) : super(key: key);

  @override
  State<TambahBulan> createState() => _TambahBulanState();
}

class _TambahBulanState extends State<TambahBulan> {
  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Perbulan"),
      ),
      body: ListView(children: [
        Center(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 500,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFF9AD0EC),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller1,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const BulanPage();
                  }));
                },
                child: const Text('Tambah Data',
                    style: TextStyle(fontSize: 16, color: Colors.black)))
          ]),
        ),
      ]),
    );
  }
}
