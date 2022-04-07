import 'dart:developer';

import 'package:aplikasi/app/screen/login/login.dart';
import 'package:aplikasi/app/screen/register/register.dart';
import 'package:flutter/material.dart';

class halamanutama extends StatelessWidget {
  const halamanutama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 255, 191),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 150),
            Container(
                child: Image.asset(
              'assets/images/....png',
              height: 150,
            )),
            SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Color.fromARGB(255, 16, 166, 204)),
                  child: Text(
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
                          return register();
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
