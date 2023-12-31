import 'package:clock_app/homescreen.dart';
import 'package:clock_app/transform_widget.dart';
import 'package:clock_app/ui/demoscrenn.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    ClockApp(),
  );
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const DemoScreen(),
      // home: const HomeScreen(),
    );
  }
}
