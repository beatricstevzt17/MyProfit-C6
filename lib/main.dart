import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/controllers/user_provider.dart';
import 'package:aplikasi/app/screen/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/halaman_utama.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> selectedRoute() async {
  final pref = await SharedPreferences.getInstance();
  if (pref.getString("id") == null) {
    return runApp(
      const MyApp(
        widget: HalamanUtama(),
      ),
    );
  } else if (pref.getString("id") != null) {
    return runApp(
      MyApp(
        //kalau id != null, akan masuk/memanggil WRAPPER
        widget: Wrapper(
          userId: pref.getString("id").toString(),
        ),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  selectedRoute(); //memanggil method "selectedRoute() dr line ke-9"
}

class MyApp extends StatelessWidget {
  const MyApp({required this.widget, Key? key}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //isikan parameter "providers" [] dr user_provider.dart dg :
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RekapController(),
        )
      ],
      child: MaterialApp(
        //kalau id = null, balik ke login, kalau id != null, ke home
        home: widget,
      ),
    );
  }
}
