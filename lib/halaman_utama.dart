import 'dart:developer';

import 'package:aplikasi/app/screen/login/login.dart';
import 'package:aplikasi/app/screen/register/register.dart';
import 'package:flutter/material.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF9AD0EC),
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(height: 120),
            Transform.scale(
              scale: 0.5,
              child: Image.asset("assets/icons/salary.png"),
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const LoginPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: const Color.fromARGB(255, 16, 166, 204)),
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(fontSize: 30, fontFamily: "Poppins"),
                  )),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Color.fromARGB(255, 255, 255, 255)),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Poppins",
                        color: Color.fromARGB(255, 30, 187, 221)),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
