import 'dart:math' as math;

import 'package:aplikasi/app/controllers/rekap_controller.dart';
import 'package:aplikasi/app/models/rekap_models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// import 'package:aplikasi/app/models/grafik_models.dart';
import 'package:google_fonts/google_fonts.dart';

//navigasi ke bulan (beranda)
import 'package:aplikasi/app/screen/bulan/bulan.dart';

//navigasi ke stock
import 'package:aplikasi/app/screen/stock/stock.dart';

//navigasi ke pengaturan
import 'package:aplikasi/app/screen/pengaturan/pengaturan.dart';

//navigasi ke artikel
import 'package:aplikasi/app/screen/artikel/artikel.dart';

class GrafikPage extends StatefulWidget {
  const GrafikPage({Key? key}) : super(key: key);

  @override
  State<GrafikPage> createState() => _GrafikPageState();
}

class _GrafikPageState extends State<GrafikPage> {
  late RekapController _rekapController;
  @override
  void initState() {
    _rekapController = RekapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9AD0EC),
          title: const Text("Grafik"),
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
                  builder: (_) => const StockPage(),
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
                  builder: (_) => const GrafikPage(),
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
        body: FutureBuilder<List<DataHarian>>(
          future: _rekapController.getRekapGrafik(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }
            return BarChartSample7(dataHarian: snapshot.data!);
          },
        ),
      ),
    );
  }
}

class BarChartSample7 extends StatefulWidget {
  const BarChartSample7({required this.dataHarian, Key? key}) : super(key: key);

  final List<DataHarian> dataHarian;

  static const shadowColor = Color(0xFFCCCCCC);

  @override
  State<BarChartSample7> createState() => _BarChartSample7State();
}

class _BarChartSample7State extends State<BarChartSample7> {
  late List<DataHarian> dataHarian;
  late int value;
  List<_BarData> bardata() {
    print(value);
    return [
      _BarData(Colors.red, value.toDouble(), 18),
      _BarData(Colors.orange, 75, 18),
      _BarData(Colors.amber, 18, 18),
      _BarData(Colors.yellow, 60, 18),
      _BarData(Colors.lightGreen, 50, 18),
      _BarData(Colors.green, 0, 18),
      _BarData(Color(0xFF57CAFF), 0, 18),
      _BarData(Colors.blue, 0, 18),
      _BarData(Color(0xFF0026B0), 0, 18),
      _BarData(Color(0xFFFF7FDF), 0, 18),
      _BarData(Color(0xFFB000CF), 0, 18),
      _BarData(Color(0xFF730087), 0, 18),
    ];
  }

  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;
  int hitungProfit() {
    int val = 0;
    dataHarian.forEach((element) {
      val += element.pengeluaran;
    });
    return val;
  }

  @override
  void initState() {
    dataHarian = widget.dataHarian.where((element) {
      final date = element.tanggalBuat;
      return DateTime.now().subtract(const Duration(days: 7)).isBefore(date);
    }).toList();
    value = hitungProfit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.5,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  borderData: FlBorderData(
                    show: true,
                    border: const Border.symmetric(
                      horizontal: BorderSide(
                        color: Color(0xFFececec),
                      ),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      drawBehindEverything: true,
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Color(0xFF606060),
                            ),
                            textAlign: TextAlign.left,
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: _IconWidget(
                              index: index,
                              color: bardata()[index].color,
                              isSelected: touchedGroupIndex == index,
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: const Color(0xFFececec),
                      dashArray: null,
                      strokeWidth: 1,
                    ),
                  ),
                  barGroups: bardata().asMap().entries.map((e) {
                    final index = e.key;
                    final data = e.value;
                    return generateBarGroup(
                        index, data.color, data.value, data.shadowValue);
                  }).toList(),
                  maxY: 100,
                  barTouchData: BarTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipMargin: 0,
                        getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                        ) {
                          return BarTooltipItem(
                            rod.toY.toString(),
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                color: rod.color!,
                                fontSize: 18,
                                shadows: const [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 12,
                                  )
                                ]),
                          );
                        }),
                    touchCallback: (event, response) {
                      if (event.isInterestedForInteractions &&
                          response != null &&
                          response.spot != null) {
                        setState(() {
                          touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;
                        });
                      } else {
                        setState(() {
                          touchedGroupIndex = -1;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarData {
  final Color color;
  final double value;
  final double shadowValue;

  const _BarData(this.color, this.value, this.shadowValue);
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  final Color color;
  final bool isSelected;
  final int index;

  const _IconWidget({
    required this.color,
    required this.isSelected,
    required this.index,
  }) : super(duration: const Duration(milliseconds: 300));

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
        transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
        origin: const Offset(14, 14),
        child: (widget.index == 0)
            ? const Text("Jan")
            : (widget.index == 1)
                ? const Text("Feb")
                : (widget.index == 2)
                    ? const Text("Mar")
                    : (widget.index == 3)
                        ? const Text("Apr")
                        : (widget.index == 4)
                            ? const Text("May")
                            : (widget.index == 5)
                                ? const Text("Jun")
                                : (widget.index == 6)
                                    ? const Text("Jul")
                                    : (widget.index == 7)
                                        ? const Text("Aug")
                                        : (widget.index == 8)
                                            ? const Text("Sep")
                                            : (widget.index == 9)
                                                ? const Text("Oct")
                                                : (widget.index == 10)
                                                    ? const Text("Nov")
                                                    : const Text("Dec"));
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>;
  }
}
