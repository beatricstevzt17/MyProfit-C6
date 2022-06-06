import 'package:flutter/material.dart';
import 'package:aplikasi/app/models/artikel_models.dart';

//path parent
import 'package:aplikasi/app/screen/artikel/artikel.dart';

class Berita extends StatelessWidget {
  const Berita({required this.content2, Key? key}) : super(key: key);

  final ArtikelContent content2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //1) Container utk image & button arrow back
          SizedBox(
            //alas
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width * 0.8,
            child: Stack(
              children: [
                //a) image
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(content2.gambar),
                    ),
                  ),
                ),

                //b) icon button utk back
                Container(
                  margin: const EdgeInsets.only(top: 22),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ArtikelPage(),
                        ),
                      ),
                      tooltip: "Back",
                    ),
                  ),
                )
              ],
            ),
          ),

//////////////////////////////////////////////////////////////////////////
          //2) Container utk ISI BERITA
          Container(
            padding: const EdgeInsets.all(10),
            //alas
            margin: const EdgeInsets.only(top: 220),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: ListView(
              children: <Widget>[
                //a) JUDUL
                Text(
                  content2.judul,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),

                //b) isi berita
                Text(
                  content2.isiberita,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
