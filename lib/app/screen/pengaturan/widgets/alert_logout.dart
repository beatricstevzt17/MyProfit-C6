import 'package:aplikasi/app/screen/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/auth.dart';
import '../../login/login.dart';

class AlertLogout extends StatelessWidget {
  const AlertLogout({required this.auth, Key? key}) : super(key: key);
  final Auth auth;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Perhatian!"),
      content: const Text("Apakah anda yakin ingin logout?"),
      actions: [
        //jika "TIDAK"
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Tidak"),
        ),
/////////////////////////////////////////////////
        //jika "YA/YAKIN" utk LOGOUT
        ElevatedButton(
          onPressed: () async {
            final pref = await SharedPreferences.getInstance();
            pref.remove("id");
            showDialog(
              context: context,
              builder: (_) => const CustomLoading(),
            );
            await auth.logout().then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
                (route) => false));
          },
          child: const Text("Ya"),
        ),
      ],
    );
  }
}
