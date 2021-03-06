import 'package:aplikasi/app/controllers/auth.dart';
import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:aplikasi/app/screen/pengaturan/widgets/alert_logout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//navigasi ke ubah profile
import 'package:aplikasi/app/screen/pengaturan/widgets/ubah_profile.dart';

//navigasi ke bulan (beranda)
import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:provider/provider.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({Key? key}) : super(key: key);

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  //untuk LOGOUT
  late Auth _auth;
  @override
  void initState() {
    _auth = Auth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //inisialisasi utk mengambil user
    final user = Provider.of<UserProvider>(context, listen: false).getUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (_) => const BulanPage(),
            ),
          ),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xFF9AD0EC),
        title: const Text("Pengaturan"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 9),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              child: ListTile(
                //MENGAMBIL DATA USER & PHOTO PROFILE
                title: Text(user.username),
                leading: CircleAvatar(
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: user.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
          ),

//////////////////////////////////// UBAH PROFILE //////////////////////////
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => UbahProfile(
                            username: user.username,
                            image: user.image,
                          ))).then((value) {
                setState(() {});
              });
            },
            child: pengaturanProfile(context, "Ubah Profile", Icons.key),
          ),

/////////////////////////////////// LOGOUT ///////////////////////////
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertLogout(
                    auth:
                        _auth), //memanggil variabel _auth yg ada di line ke-20
              );
            },
            child: pengaturanProfile(context, "LogOut", Icons.logout),
          ),

////////////////////////////////////// BANTUAN ////////////////////////
          GestureDetector(
              onTap: () {},
              child: pengaturanProfile(context, "Bantuan", Icons.help)),
        ],
      ),
    );
  }

//////////////////////////////////////////// METHOD ////////////////////////////
  Widget pengaturanProfile(
      BuildContext context, String namaSetting, IconData ikon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        //perbaiki border profile
        decoration: const BoxDecoration(
          // color: Colo/rs.amber,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color.fromARGB(255, 166, 166, 166),
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: [
            Icon(
              ikon,
              color: const Color.fromARGB(255, 94, 157, 188),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(namaSetting),
          ],
        ),
      ),
    );
  }
}
