import 'package:flutter/material.dart';
//navigasi ke ubah profile
import 'package:aplikasi/app/screen/pengaturan/widgets/ubah_profile.dart';

//navigasi ke bulan (beranda)
import 'package:aplikasi/app/screen/bulan/bulan.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({Key? key}) : super(key: key);

  get index => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const UbahProfile())),
                    child: const ListTile(
                      title: Text("Jangkung Satria"),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/474x/65/25/a0/6525a08f1df98a2e3a545fe2ace4be47.jpg"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const UbahProfile()));
                },
                child: pengaturanProfile(context, "Ubah Profile", Icons.key)),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const UbahProfile()));
                },
                child: pengaturanProfile(context, "LogOut", Icons.logout)),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const UbahProfile()));
                },
                child: pengaturanProfile(context, "Bantuan", Icons.help)),
          ],
        ),
      ),
    );
  }

//////////////////////////////////////////// METHOD ////////////////////////////
  Container pengaturanProfile(
      BuildContext context, String namaSetting, IconData ikon) {
    return Container(
      padding: const EdgeInsets.all(25),
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
      margin: const EdgeInsets.only(top: 19),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          Icon(ikon),
          const SizedBox(
            width: 10,
          ),
          Text(namaSetting),
        ],
      ),
    );
  }
}
