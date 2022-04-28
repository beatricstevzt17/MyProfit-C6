import 'package:aplikasi/app/models/user_mode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserProvider with ChangeNotifier {
  UserModel? _user;
  
  //"setUser" utk meng-set _user dg mengisi parameter yg akan dipakai di line ke-17
  set setUser(UserModel user) => _user = user;

  //"getUser" mengambil data user dr firebase
  UserModel get getUser => _user!;
  Future<void> getUserData({String? userId}) async {
    final data =
        await FirebaseFirestore.instance.collection("users").doc(userId).get();
    setUser = UserModel.fromJson(data.data()!);
  }
}
