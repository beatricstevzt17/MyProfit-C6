import 'dart:developer';
import 'dart:io';
//file picker
import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:aplikasi/app/screen/loading/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';

import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UbahProfile extends StatefulWidget {
  const UbahProfile({
    Key? key,
    required this.image,
    required this.username,
  }) : super(key: key);
  final String image;
  final String username;

  @override
  State<UbahProfile> createState() => _UbahProfileState();
}

class _UbahProfileState extends State<UbahProfile> {
  late TextEditingController nama;

  File? img;
  String? _imgUrl;
  String? _imgName;

//1
  Future<void> pilihGambar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      img = File(result.files.single.path.toString());
      _imgName = result.files.single.name;
    } else {
      log(">>> Tidak ada gambar yang dipilih <<<");
    }
    setState(() {});
  }

//2
  Future<void> getImgUrl({String? imgName}) async {
    _imgUrl = await FirebaseStorage.instance.ref(imgName).getDownloadURL();
  }

//3
  Future<void> uploadImg({String? imgName, File? imgFile}) async {
    try {
      await FirebaseStorage.instance.ref(imgName).putFile(imgFile!);
      log("Image uploaded");
    } on FirebaseException catch (e) {
      log(e.message!);
    }
  }

//4
  Future<void> updateUser(UserProvider user) async {
    (img != null) ? await uploadImg(imgFile: img, imgName: _imgName) : null;
    (img != null) ? await getImgUrl(imgName: _imgName) : null;
    await user
        .updateUser(
          username: nama.text,
          userId: user.getUser.userId,
          image: (img != null) ? _imgUrl : widget.image,
        )
        .then(
          (value) => Navigator.pop(context),
        );
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
            //1) foto profile
            GestureDetector(
              onTap: () {
                //memanggil method pilihGambar() utk membuka galeri
                pilihGambar();
              },
              child: CircleAvatar(
                radius: 50,
                child: ClipOval(
                  //kalau != null, maka ia akan mengambil gambar yg dipilih dr file
                  child: (img != null)
                      ? Image.file(
                          img!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      //kalau == null, maka ia akan mengambil gambar default (kosongan)
                      : Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: widget.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            //icon edit pd circle avatar
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.black38,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(Icons.edit),
                              ),
                            )
                          ],
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

            //3) button "ubah profile"
            ElevatedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (_) => const CustomLoading(),
                  );
                  await updateUser(user).then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PengaturanPage(),
                      ),
                    ),
                  );
                },
                child: const Text("Ubah Profile"))
          ],
        ),
      ),
    );
  }
}
