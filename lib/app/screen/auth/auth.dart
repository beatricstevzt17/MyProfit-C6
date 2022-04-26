import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
//String? = masih ragu

//METHOD REGISTER
class Auth {
  Future<void> register({String? email, String? password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!, // ! = utk mematenkan tipe data dr param
        password: password!, // ! = utk mematenkan tipe data dr param
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //METHOD LOGIN
  Future<UserCredential> signIn(
      {String email = "email@gmail.com", String password = "password"}) async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log("Login success");
      return user;
    } on FirebaseAuthException catch (e) {
      assert(e.code != "user-not-found", "User tidak ditemukan");
      assert(e.code != "wrong-password", "Password salah");
      rethrow;
    }
  }

}
