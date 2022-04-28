import 'package:flutter/material.dart';
import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:aplikasi/app/screen/bulan/bulan.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({required this.userId, Key? key}) : super(key: key);
  final String userId;

  @override
  Widget build(BuildContext context) {
    //1) inisialisasi provider yg sudah dibuat di file "user_provider.dart" di folder controller
    final user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: user.getUserData(userId: userId),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const BulanPage();
        },
      ),
    );
  }
}
