import 'dart:developer';

import 'package:aplikasi/app/models/user_mode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
//String? = masih ragu
//Try & catch kalau ada error/kesalahan, program tidak langsung di stop, melainkan menangkap error, agar apk tetap berjalan

class Auth {
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> METHOD REGISTER <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<void> register({
    String? email,
    String? password,
    String? username,
  }) async {
    const profile =
        "https://firebasestorage.googleapis.com/v0/b/myprofit-e5c4f.appspot.com/o/user.png?alt=media&token=12cecaf9-ee6b-41ab-b197-e72065256b18";
    final user = FirebaseFirestore.instance.collection("users").doc();
    final date = DateTime.now();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!, // ! = utk mematenkan tipe data dr param
        password: password!, // ! = utk mematenkan tipe data dr param
      );
      //agar line 16-24 ke simpan di firestore juga, jd ga hanya kesimpan di firebase saja
      await user.set(UserModel(
              userId: user.id,
              username: username!,
              email: email,
              password: password,
              image: profile,
              createAt: date,
              updateAt: date)
          .toJson());
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

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> METHOD LOGIN <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<UserCredential> signIn(
      {String email = "email@gmail.com", String password = "password"}) async {
    //agar login cukup 1x saja
    final user = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();

    final userData = UserModel.fromJson(user.docs.first.data());
    final pref = await SharedPreferences.getInstance();
    pref.setString("id", userData.userId);
   
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

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> METHOD LOGOUT <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<void> logout() async {
    //membuat method "logout" yg kita buat sendiri yg isinya :
    await FirebaseAuth.instance
        .signOut(); //memanggil method "SignOut" bawaan perintah dr firebase
  }
}
