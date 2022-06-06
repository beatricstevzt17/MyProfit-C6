import 'package:flutter/material.dart';
import 'package:aplikasi/app/models/artikel_models.dart';

//path parent

//navigasi ke page berita
import 'package:aplikasi/app/screen/artikel/widgets/berita.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtikelWidget extends StatelessWidget {
  const ArtikelWidget({required this.content, Key? key}) : super(key: key);

  final ArtikelContent content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: const BoxDecoration(
        // border: Border(
        //   bottom: BorderSide(width: 2),
        // ),
        color: Color(0xA9B2E5FF),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Berita(content2: content),
            ),
          ),
          child: Row(
            children: <Widget>[
              //1) container utk gambar
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(content.gambar), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              //2) column utk judul & topik
              Column(
                children: <Widget>[
                  //a) judul
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      content.judul,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
