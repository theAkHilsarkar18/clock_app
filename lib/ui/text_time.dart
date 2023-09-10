import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TimeInText extends StatefulWidget {
  const TimeInText({super.key});

  @override
  State<TimeInText> createState() => _TimeInTextState();
}

class _TimeInTextState extends State<TimeInText> {
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if(dateTime.second != DateTime.now().second)
        {
          setState(() {
            dateTime = DateTime.now();
          });
        }
      },
    );

  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    int second = dateTime.second;
    return Container(
      width: width,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$hour:$minute:$second',style: const TextStyle(fontSize: 40,letterSpacing: 2),),
          RotatedBox(quarterTurns: 3,child: Text(dateTime.hour>=12?'PM':'AM',style: const TextStyle(fontSize: 15,color: Colors.grey),),),
        ],
      ),
    );
  }
}
