import 'package:aplikasi/app/screen/login/login.dart';
import 'package:aplikasi/app/screen/register/register.dart';
import 'package:flutter/material.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9AD0EC),
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            const SizedBox(height: 120),
            Align(
              alignment: const Alignment(0, -0.5),
              child: Transform.scale(
                scale: 0.5,
                child: Image.asset("assets/icons/salary.png"),
              ),
            ),
            const SizedBox(height: 100),
            Align(
              alignment: const Alignment(0, 0.8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return const RegisterPage();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          primary: const Color.fromARGB(255, 255, 255, 255)),
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Poppins",
                            color: Color.fromARGB(255, 30, 187, 221)),
                      )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
