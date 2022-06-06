import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:aplikasi/app/screen/register/register.dart';
import 'package:aplikasi/style/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth.dart';
import '../loading/loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;

  //1) bikin controller utk textform
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();

  //2) inisialisasi Auth (dr auth.dart)
  late Auth _auth; //class Auth() dibungkus dg variabel _auth
  @override
  void initState() {
    _auth = Auth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFF9AD0EC),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('LOGIN',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              const Text(
                'Login To Your Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 60),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26))
                ]),
                child: TextField(
                  controller: _emailC,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'example@gmail.com',
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26))
                ]),
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
                    hintText: 'password123',
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: color1,
                    ),
                    suffixIcon: IconButton(
                      icon: isVisible
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.visibility_off),
                      onPressed: () => setState(() {
                        isVisible = !isVisible;
                      }),
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: borderRadius1,
                    color: color1,
                    boxShadow: [boxshadow1]),
                child: TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AUTH (autentikasi) <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                    onPressed: () async {
                      //memberi "loading"
                      showDialog(
                          context: context,
                          builder: (_) => const CustomLoading());
                      await _auth
                          //3) memanggil method signIn() & memasukan nilai parameter dr inputan textform
                          .signIn(
                              email: _emailC.text,
                              password: _passC.text,
                              userProvider: user)
                          //4) menjalankan navigasi jika button selesai di klik
                          .then((_) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return const BulanPage();
                                  },
                                ),
                                (route) => false,
                              ));
                    }),
              ),
              TextButton(
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
                  child: const Text(
                    'create account',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
//perbaikan
