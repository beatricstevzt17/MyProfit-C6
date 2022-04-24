import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    const _spinkit = SpinKitPouringHourGlass(
      color: Color.fromARGB(255, 255, 196, 0),
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: _size.height * 0.2,
          height: _size.height * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _spinkit,
              Text(
                "Loading ...",
                style: TextStyle(color: Colors.black, fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }
}
