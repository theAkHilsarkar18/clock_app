import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu_open_rounded),
          title: const Text(
            "Clock App",
          ),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: CustomPaint(
              painter: ClockPainter(),
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

    double sizeX = size.height/2;
    double sizeY = size.width/2;
    Offset center =  Offset(sizeX,sizeY);
    canvas.drawCircle(center, 10, Paint()..color = Colors.white);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}

