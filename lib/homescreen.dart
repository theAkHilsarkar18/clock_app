import 'package:clock_app/ui/analog_time.dart';
import 'package:clock_app/ui/text_time.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE3FDFD),
        appBar: AppBar(
          backgroundColor: const Color(0xffE3FDFD),

          leading: const Icon(Icons.menu_open_rounded),
          title: const Text("Clock App"),
        ),
        body: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TimeInText(),
            AnalogTimeClock(),
          ],
        ),
      ),
    );
  }
}
