import 'package:flutter/material.dart';

class hari_page extends StatefulWidget {
  const hari_page({Key? key}) : super(key: key);

  @override
  State<hari_page> createState() => _hari_pageState();
}

class _hari_pageState extends State<hari_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
            width: 350,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.amber,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ubah();
                  }));
                },
                child: Center(
                    child: Text(
                  "Sabtu 26/3/2022 [cont-1]",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.amber,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ubah();
                  }));
                },
                child: Center(
                    child: Text(
                  "Jumat 25/3/2022 [cont-2]",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.amber,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ubah();
                  }));
                },
                child: Center(
                    child: Text(
                  "Kamis 24/3/2022 [cont-3]",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.amber,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ubah();
                  }));
                },
                child: Center(
                    child: Text(
                  "Rabu 23/3/2022 [cont-4]",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(50),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return tambah();
                }));
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
          ),
        ]),
      ),
    );
  }
}

class tambah extends StatefulWidget {
  const tambah({Key? key}) : super(key: key);

  @override
  State<tambah> createState() => _tambahState();
}

class _tambahState extends State<tambah> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Penjualan"),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: Text(
                        "Tanggal",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffCEFFBC),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: Text(
                        "Pemasukan",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffCEFFBC),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: Text(
                        "Pengeluaran",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffCEFFBC),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: Text(
                        "Jumlah yang terjual",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffCEFFBC),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                      child: Text(
                        "Ulasan/Feedback",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffCEFFBC),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 40,
                      width: 270,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return hari_page();
                      }));
                    },
                    child: Text('Tambah Data',
                        style: TextStyle(fontSize: 16, color: Colors.black)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ubah extends StatefulWidget {
  const ubah({Key? key}) : super(key: key);

  @override
  State<ubah> createState() => _ubahState();
}

class _ubahState extends State<ubah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Laporan Penjualan"),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                        child: Text(
                          "Tanggal",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffCEFFBC),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                        child: Text(
                          "Pemasukan",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffCEFFBC),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                        child: Text(
                          "Pengeluaran",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffCEFFBC),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                        child: Text(
                          "Jumlah yang terjual",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffCEFFBC),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 10, 5),
                        child: Text(
                          "Ulasan/Feedback",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffCEFFBC),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 40,
                        width: 270,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return hari_page();
                        }));
                      },
                      child: Text('Ubah Data',
                          style: TextStyle(fontSize: 16, color: Colors.black)))
                ],
              ),
            ),
          ],
        ));
  }
}
