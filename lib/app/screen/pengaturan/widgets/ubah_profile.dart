import 'dart:io';
//file picker
import 'package:file_picker/file_picker.dart';

import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';
import 'package:flutter/material.dart';

class UbahProfile extends StatefulWidget {
  const UbahProfile({Key? key}) : super(key: key);

  @override
  State<UbahProfile> createState() => _UbahProfileState();
}

class _UbahProfileState extends State<UbahProfile> {
  TextEditingController nama = TextEditingController();
  TextEditingController telepon = TextEditingController();

  File? img;
  Future<void> pilihGambar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      img = File(result.files.single.path.toString());
    } else {
      print(">>> Tidak ada gambar yang dipilih <<<");
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9AD0EC),
          title: const Text("Profile"),
          leading: IconButton(
            onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (_) => const PengaturanPage(),
              ),
            ),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //1) foto profile
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.amber),
                child: Material(
                  //  shape: ci,
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            //2) nama
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.person),
                  labelText: "Nama"),
            ),
            const SizedBox(height: 20),

            //3) telepon
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.call),
                  labelText: "Telepon"),
            ),
            const SizedBox(height: 20),

            //4) button "ubah profile"
            ElevatedButton(onPressed: () {}, child: const Text("Ubah Profile"))
          ],
        ),
      ),
    );
  }
}
