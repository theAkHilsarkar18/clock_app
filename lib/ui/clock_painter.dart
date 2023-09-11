import 'package:flutter/cupertino.dart';

class ClockPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {

      double centerX = size.width/2;
      double centerY = size.height/2;
      Offset center = Offset(centerX, centerY);
      canvas.drawCircle(center, 23, Paint()..color = const Color(0xff71C9CE));
      canvas.drawCircle(center, 10, Paint()..color = const Color(0xffCBF1F5));
      canvas.drawLine(center, const Offset(80,120), Paint()..color = const Color(0xff71C9CE));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
  
}