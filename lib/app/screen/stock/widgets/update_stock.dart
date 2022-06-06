import 'package:aplikasi/app/controllers/stock_controller.dart';
import 'package:flutter/material.dart';

//models
import 'package:aplikasi/app/models/stock_models.dart';

//parent
import 'package:aplikasi/app/screen/stock/stock.dart';

class UpdateStock extends StatefulWidget {
  const UpdateStock({required this.konten, Key? key}) : super(key: key);
  //1)
  final StockModel konten;

  @override
  State<UpdateStock> createState() => _UpdateStockState();
}

//2) memesan variabel controler1,2,3 dan akan berjalan ketika page ubah stock dibuka
class _UpdateStockState extends State<UpdateStock> {
  late TextEditingController controller1;
  late TextEditingController controller2;

//3) inisialisasi variabel "stok" yg membungkus StockController
  StockController stok = StockController();

//4) inisialisasi controller1,2,3 utk read (mengambil data dr firebase)
  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();

    controller1.text = widget.konten.namaItem;
    controller2.text = widget.konten.jumlah;
    super.initState();
  }

//agar hemat memory
  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AD0EC),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (_) => const StockPage(),
            ),
          ),
          tooltip: "Back",
        ),
        title: const Text("Ubah Stok Bahan"),
      ),
//////////////////////////////////////////// TEXT FIELD /////////////////////////////////////////
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          //1) nama stock
          TextField(
            controller: controller1,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.coffee_maker_outlined),
                labelText: "Nama Stok"),
          ),
          const SizedBox(height: 20),

          //2) jumlah stock
          TextField(
            controller: controller2,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.category_outlined),
                labelText: "Jumlah"),
          ),
          const SizedBox(height: 20),

          //4) button "simpan"
          ElevatedButton(
              onPressed: () async {
                await Future.delayed(
                  const Duration(seconds: 1),
                );
                await stok.ubahStock(
                  idStock: widget.konten.id,
                  namaItem: controller1.text,
                  jumlah: controller2.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StockPage(),
                  ),
                ).then((value) => setState(() {
                      stok.getStock();
                    }));
              },
              child: const Text("Simpan"))
        ],
      ),
    );
  }
}
