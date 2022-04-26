// class StockContent {
//   final String gambar;
//   final String nama;
//   final String jumlah;

//   StockContent(
//       {required this.gambar, required this.nama, required this.jumlah});
// }



class StockModel {
    StockModel({
        required this.id,
        required this.jumlah,
        required this.namaItem,
        required this.gambar,
    });

    final String id;
    final String jumlah;
    final String namaItem;
    final String gambar;

    factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
      //utk menerima (GET)
        id: json["id"],
        jumlah: json["jumlah"],
        namaItem: json["nama_item"],
        gambar: json["gambar"],
    );

    Map<String, dynamic> toJson() => {
      //utk mengirim (POST)
        "id": id,
        "jumlah": jumlah,
        "nama_item": namaItem,
        "gambar": gambar,
    };
}
