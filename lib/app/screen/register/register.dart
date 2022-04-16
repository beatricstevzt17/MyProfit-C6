import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:aplikasi/app/screen/hari/hari.dart';
import 'package:aplikasi/app/screen/login/login.dart';
import 'package:aplikasi/style/style.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF9AD0EC),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'REGISTER',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const Text('Sign Up For Free',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              const SizedBox(height: 60),
              Container(
                margin: const EdgeInsets.only(bottom: 15, top: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _userC,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'yourusername',
                    labelText: 'Username',
                    prefixIcon: Icon(
                      Icons.person,
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _emailC,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'example@krisstudio.com',
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _passC,
                  obscureText: isVisible ? false : true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: '@_yourpassword',
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: color1,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        isVisible = !isVisible;
                      }),
                      icon: isVisible
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.visibility_off),
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                //width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: borderRadius1,
                    color: color1,
                    boxShadow: [boxshadow1]),
                child: TextButton(
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white),
                  ),
                 onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const BulanPage();
                        },
                      ),
                    );
                  },
                ),
              ),
              TextButton(
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
                  child: const Text(
                    'Already have an account?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
