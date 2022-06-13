import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:flutter/material.dart';

class TambahBulan extends StatefulWidget {
  const TambahBulan({Key? key}) : super(key: key);

  @override
  State<TambahBulan> createState() => _TambahBulanState();
}

class _TambahBulanState extends State<TambahBulan> {
  TextEditingController controller1 = TextEditingController();

  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Data Perbulan"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                          value: value,
                          items: [
                            customDropdown(label: "Januari", val: 1),
                            customDropdown(label: "Februari", val: 2),
                            customDropdown(label: "Maret", val: 3),
                            customDropdown(label: "April", val: 4),
                            customDropdown(label: "Mei", val: 5),
                            customDropdown(label: "Juni", val: 6),
                            customDropdown(label: "Juli", val: 7),
                            customDropdown(label: "Agustus", val: 8),
                            customDropdown(label: "September", val: 9),
                            customDropdown(label: "Oktober", val: 10),
                            customDropdown(label: "November", val: 11),
                            customDropdown(label: "Desember", val: 12),
                          ],
                          onChanged: (val) {
                            setState(() {
                              value = val!;
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const BulanPage();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF5584AC),
            ),
            child: const Text(
              'Tambah Data',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  DropdownMenuItem<int> customDropdown({String? label, int? val}) {
    return DropdownMenuItem(
      child: Text(label.toString()),
      value: val!.toInt(),
    );
  }
}
