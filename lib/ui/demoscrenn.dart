import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}
DateTime dateTime = DateTime.now();
class _DemoScreenState extends State<DemoScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(dateTime != DateTime.now())
          {
            dateTime = DateTime.now();
          }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Clock App",
          ),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration:  BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.deepPurpleAccent,width: 2)
            ),
            child: Transform.rotate(
              angle: -pi/2,
              child: CustomPaint(
                painter: ClockPainter(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {

    var centerX = size.width/2;
    var centerY = size.height/2;
    Offset center = Offset(centerX, centerY);


    // main circle
    Paint mainCircle = Paint()..color = Colors.white;
    canvas.drawCircle(center, 140, mainCircle);

    // hour line
    var hourX = centerX + size.width * 0.20 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourY = centerY + size.height * 0.20 * sin((dateTime.hour * 0.5) * pi / 180);
    Paint hourLine = Paint()..color = Colors.blueAccent..strokeWidth = 15..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(hourX, hourY), hourLine);

    // minute line
    var minuteX = centerX + size.width * 0.30 * cos((dateTime.minute * 6) * pi / 180 );
    var minuteY = centerY + size.height * 0.30 * sin((dateTime.minute * 6) * pi / 180 );

    Paint minuteLine = Paint()..color = Colors.deepPurple..strokeWidth = 7..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(minuteX, minuteY), minuteLine);

    // second line
    var secondX = centerX + size.width * 0.38 * cos((dateTime.second * 6) * pi / 180);
    var secondY = centerY + size.width * 0.38 * sin((dateTime.second * 6) * pi / 180);

    Paint secondLine = Paint()..color = Colors.deepPurpleAccent..strokeWidth = 5..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(secondX,secondY), secondLine);

    // center dot circle
    Paint centerDotCircle = Paint()..color = Colors.purpleAccent;
    canvas.drawCircle(center, 15, centerDotCircle);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


