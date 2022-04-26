// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// //model
// import 'package:aplikasi/app/models/stock_models.dart';
// //parent
// import 'package:aplikasi/app/screen/stock/stock.dart';

// class TambahStock extends StatelessWidget {
//   const TambahStock({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF9AD0EC),
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//               size: 30,
//             ),
//             onPressed: () => Navigator.pop(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => StockPage(),
//               ),
//             ),
//             tooltip: "Back",
//           ),
//           title: const Text("Tambah Stok Bahan"),
//         ),
// //////////////////////////////////////////// TEXT FIELD /////////////////////////////////////////
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(height: 20),
//             //1) nama stock
//             TextField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   prefixIcon: const Icon(Icons.coffee_maker_outlined),
//                   labelText: "Nama Stok"),
//             ),
//             const SizedBox(height: 20),

//             //2) jumlah stock
//             TextField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   prefixIcon: const Icon(Icons.category_outlined),
//                   labelText: "Jumlah"),
//             ),
//             const SizedBox(height: 20),

//             //4) button "ubah profile"
//             ElevatedButton(onPressed: () {}, child: const Text("Simpan"))
//           ],
//         ),
//       ),
//     );
//   }
// }
