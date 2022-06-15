import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/pdf_api.dart';
import '../api/pdf_invoice_api.dart';
import '../model/customer.dart';
import '../model/invoice.dart';
import '../model/supplier.dart';
import '../widget/button_widget.dart';
import '../widget/title_widget.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("PDF"),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection("rekapitulasi_harian")
                .orderBy("tanggal_buat", descending: false)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const TitleWidget(
                        icon: Icons.picture_as_pdf,
                        text: 'Generate Invoice',
                      ),
                      const SizedBox(height: 48),
                      ButtonWidget(
                        text: 'Generate PDF',
                        onClicked: () async {
                          final date = DateTime.now();
                          final dueDate = date.add(const Duration(days: 7));

                          final invoice = Invoice(
                              supplier: const Supplier(
                                name: 'Neil Kunsler',
                                address: 'Perum. Tegal Besar 1, U No. 12 A',
                                paymentInfo: 'https://paypal.me/sarahfieldzz',
                              ),
                              customer: const Customer(
                                name: '',
                                address: '',
                              ),
                              info: InvoiceInfo(
                                date: date,
                                dueDate: dueDate,
                                description:
                                    'Laporan Penjualan Mie Sari Buah Naga',
                                number: '${DateTime.now().year}-9999',
                              ),
                              items: snapshot.data!.docs
                                  .map((e) => InvoiceItem(
                                      date: DateFormat("dd/MM/yyyy").format(
                                          (e["tanggal_buat"] as Timestamp)
                                              .toDate()),
                                      quantity: e["jumlah_terjual"],
                                      pendapatan: e["pendapatan"],
                                      pengeluaran: e["pengeluaran"]))
                                  .toList());

                          final pdfFile = await PdfInvoiceApi.generate(invoice);

                          PdfApi.openFile(pdfFile);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
}
