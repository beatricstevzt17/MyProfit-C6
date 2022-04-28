import 'dart:developer';
import 'dart:io';
//file picker
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';

import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/user_provider.dart';

class UbahProfile extends StatefulWidget {
  const UbahProfile({required this.image, required this.username, Key? key})
      : super(key: key);
  final String image;
  final String username;

  @override
  State<UbahProfile> createState() => _UbahProfileState();
}

class _UbahProfileState extends State<UbahProfile> {
  late TextEditingController nama;

  File? img;
  Future<void> pilihGambar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      img = File(result.files.single.path.toString());
    } else {
      log(">>> Tidak ada gambar yang dipilih <<<");
    }
    setState(() {});
  }

  @override
  void initState() {
    nama = TextEditingController();
    nama.text = widget.username;
    super.initState();
  }

  @override
  void dispose() {
    nama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //1) pilih gambar foto profile
            GestureDetector(
              onTap: () {
                pilihGambar();
              },
            ),
            Center(
              child: CircleAvatar(
                //mengambil photo profile yg sudah tersimpan di storage
                child: ClipOval(
                  //a) kalau tidak null -> dia akan mengambil gambar profile yg dipilih dr galery
                  child: (img != null)
                      ? Image.file(
                          img!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      //b) kalau null -> dia akan memasang profile default kosongan
                      : CachedNetworkImage(
                          imageUrl: widget.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            //2) nama
            TextField(
              controller: nama,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.person),
                  labelText: "Nama"),
            ),
            const SizedBox(height: 20),

            //4) button "ubah profile"
            ElevatedButton(
                onPressed: () async {
                  await user
                      .updateUser(
                        username: nama.text,
                        userId: user.getUser.userId,
                      )
                      .then((value) => Navigator.pop(context));
                },
                child: const Text("Ubah Profile"))
          ],
        ),
      ),
    );
  }
}
