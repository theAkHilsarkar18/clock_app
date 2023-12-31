import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'clock_painter.dart';

class AnalogTimeClock extends StatefulWidget {
  const AnalogTimeClock({super.key});

  @override
  State<AnalogTimeClock> createState() => _AnalogTimeClockState();
}

class _AnalogTimeClockState extends State<AnalogTimeClock> {
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 1,),(timer) {
        setState(() {
          dateTime = DateTime.now();
        });
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.42,
      width: width,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xffCBF1F5),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Color(0xffE3FDFD),offset: Offset(0,0),blurRadius: 64)
        ]
      ),
      child: Transform.rotate(
        angle: -pi/2,
        child: CustomPaint(
          painter: ClockPainter(dateTime: dateTime),
        ),
      )
    );
  }
}
