import 'dart:math';

import 'package:flutter/cupertino.dart';

class ClockPainter extends CustomPainter {
  DateTime dateTime;

  ClockPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    //second line
    // Second Calculation
    // size.width * 0.4 define our line height
    // dateTime.second * 6 because 360 / 60 = 6
    double secondX = centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY = centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);
    canvas.drawLine(center, Offset(secondX, secondY), Paint()..color = const Color(0xff71C9CE)..strokeWidth = 2);
    //minutes line
    // Minute Calculation
    double minX = centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY = centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);
    canvas.drawLine(center, Offset(minX, minY), Paint()..color = const Color(0xffA6E3E9)..strokeWidth = 5,);
    //hour line
    // Hour Calculation
    // dateTime.hour * 30 because 360/12 = 30
    // dateTime.minute * 0.5 each minute we want to turn our hour line a little
    double hourX = centerX + size.width * 0.3 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY + size.width * 0.3 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourX, hourY), Paint()..color = const Color(0xff71C9CE)..strokeWidth = 10,);

    canvas.drawCircle(center, 23, Paint()..color = const Color(0xff71C9CE));
    canvas.drawCircle(center, 10, Paint()..color = const Color(0xffCBF1F5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
