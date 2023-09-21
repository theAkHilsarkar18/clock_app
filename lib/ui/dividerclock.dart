import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DividerClockScreen extends StatefulWidget {
  const DividerClockScreen({super.key});

  @override
  State<DividerClockScreen> createState() => _DividerClockScreenState();
}
DateTime dateTime = DateTime.now();

class _DividerClockScreenState extends State<DividerClockScreen> {

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
          leading: const Icon(Icons.menu_open_rounded),
          title: const Text("Divider Clock App"),
        ),
        body: Center(
          child: Transform.rotate(
            angle: pi/2,
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle
              ),
              alignment: Alignment.center,
              child: Container(
                height: 270,
                width: 270,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child:  Stack(
                  children: [
                    ...List.generate(60, (index) => Center(child: Transform.rotate(angle: (index + 1) * 6 * pi / 180,child: Divider(color: index%5==0?Colors.black:Colors.red,endIndent: index%5==0 ? 240 : 250 ,thickness: index%5==0?5:1.5,)))),
                    Center(child: Transform.rotate(angle: (dateTime.second + 1) * 6 * pi / 180,child: const Divider(color: Colors.black,thickness: 3,indent: 35,endIndent: 100,)),),
                    Center(child: Transform.rotate(angle: (dateTime.minute + 1) * 6 * pi / 180,child: const Divider(color: Colors.blue,thickness: 4,indent: 40,endIndent: 110,)),),
                    Center(child: Transform.rotate(angle: (dateTime.hour + 1) * 6 * pi / 180,child: const Divider(color: Colors.red,thickness: 8,indent: 70,endIndent: 110,)),),
                    const Center(child: CircleAvatar(radius: 10,backgroundColor: Colors.black,),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
