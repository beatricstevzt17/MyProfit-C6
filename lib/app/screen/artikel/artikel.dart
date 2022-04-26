import 'package:flutter/material.dart';
import 'package:aplikasi/app/models/artikel_models.dart';
//navigasi ke content artikel
import 'package:aplikasi/app/screen/artikel/widgets/artikel_widget.dart';

//navigasi ke bulan (beranda)
import 'package:aplikasi/app/screen/bulan/bulan.dart';

//navigasi ke stock
import 'package:aplikasi/app/screen/stock/stock.dart';

//navigasi ke pengaturan
import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';

//navigasi ke grafik
import 'package:aplikasi/app/screen/grafik/grafik.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtikelPage extends StatelessWidget {
  ArtikelPage({Key? key}) : super(key: key);

  final List<ArtikelContent> artikelcontent = [
    ArtikelContent(
      gambar:
          "https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1115&q=80",
      judul: "10 Tips Sukses Memulai\nBisnis untuk Pemula",
      topik: "",
      isiberita:
          "Kesuksesan adalah hal yang dicari setiap orang. Salah satu cara yang banyak dilakukan orang untuk meraihnya adalah dengan memulai bisnis. Pemikiran untuk menjadi pengusaha sudah menjadi tren di semua kalangan masyarakat, terutama kalangan muda. Oleh karena itu, saat ini banyak orang yang sudah sukses menjadi pengusaha di usia muda. Hal ini memang tidak mengherankan, karena banyak orang yang mulai merasa lelah dan terbatas dengan hanya menjadi karyawan, sehingga pemikiran untuk membuat bisnis menjadi pilihannya.\n\nUntuk sukses memulai bisnis tidak selalu berjalan lancar, diperlukan beberapa keahlian dan langkah yang harus dilakukan dengan benar. Bahkan ada pemikiran yang berkata bahwa tidak semua orang bisa menjadi pengusaha. Tapi sebenarnya, semua orang bisa kok menjadi pengusaha jika kamu mau belajar dan bekerja keras. Scott Gerber adalah seorang pengusaha muda, penulis, dan investor asal Amerika Serikat. Berikut ini adalah 10 tips untuk sukses memulai bisnis untuk pemula oleh Scott Gerber.\n\nMenjadi seorang pebisnis berarti bersedia untuk selalu belajar, belajar dan belajar. Saat ini Anda dapat mempelajari berbagai hal tentang memulai usaha dari berbagai sumber seperti media sosial, website, berbincang dengan sesama pengusaha, mengikuti pelatihan dan lain sebagainya. Selain itu Anda pun harus terbuka terhadap kritik dan nasihat dari orang lain . Ini akan sangat berguna untuk mengevaluasi bisnis Anda agar terus berkembang. Jangan lupa untuk meriset pasar sebelum Anda memulai bisnis. Anda harus mempelajari dinamika pasar, siapa yang akan menjadi kompetitor serta bagaimana karakteristik target pasar bisnis Anda.\n\nManajemen waktu bisa menjadi hal sulit untuk dilakukan orang-orang yang memulai bisnis dari nol. Anda menganggap usaha masih kecil sehingga tidak memerlukan pengelolaan yang terus menerus. Ingat, orang akan menjadi bisa ketika terbiasa.Padahal disiplin waktu sangat penting untuk diterapkan baik untuk usaha kecil atau besar. Tentukan jam operasional usaha Anda. Ini akan membantu Anda disiplin terhadap waktu kerja dan lebih produktif setiap hari.",
    ),
    ArtikelContent(
      gambar:
          "https://images.unsplash.com/photo-1579532537598-459ecdaf39cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      judul: "Cara Jitu Memulai Usaha\ndari Nol Secara Efektif",
      topik: "",
      isiberita:
          "Sebelum memulai usaha tentukan dulu produk atau jasa apa yang ingin Anda jual kepada konsumen. Anda bisa menentukan ini dengan terlebih dahulu melakukan riset. Agar lebih menonjol dan berbeda dengan merek lainnya, Anda bisa menjual barang yang bermanfaat ataupun unik.\n\nSelain itu Anda bisa memilih untuk menjual sesuatu yang memang Anda sukai atau Anda memiliki passion di dalamnya. Selain karena menyukainya, nantinya Anda pun akan lebih bersemangat dan mau menghadapi berbagai rintangan sehingga bisa lebih cepat meraih kesuksesan.\n\nMengambil keputusan untuk memulai usaha memang mempunyai risiko yang cukup besar. Namun jika dari awal Anda sudah merasa takut gagal, bisa jadi usaha kedepannya pun akan gagal. Anda harus bisa meyakinkan diri sendiri dan buang jauh-jauh segala ketakutan mengenai kegagalan. Kegagalan memang bisa saja terjadi, namun seorang pebisnis sejati pasti akan mampu bangkit dan bisa belajar dari kegagalan tersebut. Jangan mencoba untuk mundur ketika tidak berjalan sesuai dengan rencana Anda.\n\nKetika melakukan hal-hal baru seperti memulai usaha, wajar jika ada satu atau dua hal yang masih terlupa dan beberapa hal yang masih dibingungkan. Biasakan untuk mencatat detail-detail barang, operasional, kegiatan serta tantangan yang Anda hadapi. Catatan ini nantinya bisa digunakan untuk mengingatkan apa yang terlupa, harus dibeli dan dilakukan serta dijadikan sebagai bahan evaluasi.",
    ),
    ArtikelContent(
      gambar:
          "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
      judul: "Ingin bisnis sukses?",
      topik: "",
      isiberita:
          "Banyak sekali yang takut memulai usaha karena memikirkan modal yang dianggap besar. Padahal tidak semua usaha membutuhkan modal yang besar. Jika Anda mempunyai kesulitan dalam menyiapkan modal, Anda bisa memulai dari usaha kecil-kecilan di rumah atau memanfaatkan media sosial yang gratis untuk melancarkan promosi.\n\nCatat dan hitung secara terperinci apa saja yang bisnis Anda butuhkan dan berapa biayanya. Siasati juga biaya-biaya yang akan digunakan agar lebih hemat. Contohnya jika Anda membutuhkan gerobak. Gerobak yang akan digunakan untuk operasional usaha tidak harus baru. Anda memang perlu bekerja lebih ekstra untuk mendapatkan gerobak bekas yang pas untuk usaha Anda.\n\nNamun hal itu akan terbayarkan dengan penghematan biaya yang akan didapatkan. Hal ini juga berlaku pada bahan baku. Jangan enggan untuk berkeliling ke berbagai tempat demi mendapatkan bahan baku yang lebih murah dengan kualitas terbaik.\n\nMempunyai banyak usaha memang mampu memberikan keuntungan yang berlipat. Namun di sisi lain bisa merusak fokus Anda yang justru berakibat pada kerugian. Jangan terburu-buru ingin menambah keuntungan dengan memulai usaha kedua. Pastikan usaha yang saat ini sudah benar-benar stabil, baik dari segi modal, SDM, maupun kebutuhan-kebutuhan lainnya. Bila sudah stabil, barulah buat rencana bisnis selanjutnya. Anda juga dapat mengikuti seminar maupun online course. ",
    ),
    ArtikelContent(
        gambar:
            "https://images.unsplash.com/photo-1590650046871-92c887180603?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        judul: "Emak-emak Bisa\nSukses Berwirausaha,\nBegini Caranya",
        topik: "",
        isiberita:
            "Emak-emak memiliki peluang sukses dengan cara berwirausaha. Berdasarkan catatan dari Kementerian Koordinator Bidang Perekonomian, perekonomian bangsa mulai masuk ke dalam fase pemulihan ditandai dengan geliat dari para pelaku Usaha Mikro, Kecil, dan Menengah (UMKM) seiring dengan kondisi pandemi Covid-19 yang semakin terkendali, Tercatat sebanyak 84,8 persen UMKM telah beroperasi secara normal.\n\nDidukung oleh pemanfaatan platform digital, praktik usaha dari rumah dengan mudah dapat dilakukan termasuk oleh para ibu rumah tangga atau yang sering disebut sebagai mompreneur. Celebrity dan Mompreneur Zaskia A. Mecca mengatakan, awalnya ia mengalami kesulitan melakukan kegiatan di dunia seni dan perfilman dengan kesibukan sebagai Ibu. Untuk itu, ia mencoba membuka bisnis baju muslim dengan modal awal Rp 7,5 juta dari rumah. 'Seiring menjalankan usaha, saya menjadi semakin bersemangat karena dari satu orang karyawan, kita turut membantu menghidupi banyak orang dan juga mendapat banyak doa dari banyak orang,” kata dia dalam keterangan tertulis Kamis (21/4/2022).'\n\nLewat media sosial, ia menyebut mompreneur dapat memasarkan produk kepada pasar yang lebih luas serta membuka peluang bagi konsumen untuk turut memasarkan produk dengan cuma-cuma melalui berbagai fitur promosi di media sosial. Fenomena ini menjadi salah satu bentuk kebaikan yang seringkali tidak disadari memiliki peran besar dalam kesuksesan suatu usaha. Head of Sharia Governance, Compliance & Business Settlement, Allianz Life Indonesia Nina Mudrikah Hariyati mengatakan, di luar pelatihan pengembangan usaha serta kemampuan mengelola keuangan, proteksi asuransi merupakan salah satu kebutuhan untuk melindungi para mompreneur atau pelaku UMKM dari risiko yang tidak terduga.\n\nLewat media sosial, ia menyebut mompreneur dapat memasarkan produk kepada pasar yang lebih luas serta membuka peluang bagi konsumen untuk turut memasarkan produk dengan cuma-cuma melalui berbagai fitur promosi di media sosial. Fenomena ini menjadi salah satu bentuk kebaikan yang seringkali tidak disadari memiliki peran besar dalam kesuksesan suatu usaha. Head of Sharia Governance, Compliance & Business Settlement, Allianz Life Indonesia Nina Mudrikah Hariyati mengatakan, di luar pelatihan pengembangan usaha serta kemampuan mengelola keuangan, proteksi asuransi merupakan salah satu kebutuhan untuk melindungi para mompreneur atau pelaku UMKM dari risiko yang tidak terduga."),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9AD0EC),
          title: const Text("Artikel"),
        ),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF9AD0EC)),
              child: Text(
                "MyProfit",
                style: GoogleFonts.kaushanScript(
                    fontSize: 50, color: Colors.white),
              ),
            ),
            //1.) Rekapan
            ListTile(
              title: const Text(
                "Rekapan",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BulanPage(),
                ),
              ),
            ),
            //2.) Stock Bahan
            ListTile(
              title: const Text("Stock Bahan",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StockPage(),
                ),
              ),
            ),
            //3.) Grafik
            ListTile(
              title: const Text("Grafik",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GrafikPage(),
                ),
              ),
            ),
            //4.) Artikel
            ListTile(
              title: const Text("Artikel",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ArtikelPage(),
                ),
              ),
            ),
            //5.) Pengaturan
            ListTile(
              title: const Text("Pengaturan",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PengaturanPage(),
                ),
              ),
            ),
          ]),
        ),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        body: ListView.builder(
          itemCount: artikelcontent.length,
          itemBuilder: (context, index) => ArtikelWidget(
            content: artikelcontent[index],
          ),
        ),
      ),
    );
  }
}
