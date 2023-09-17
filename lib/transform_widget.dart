import 'dart:math';

import 'package:flutter/material.dart';

class TransformScreen extends StatelessWidget {
  const TransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Transform Widget"),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.amber
            ),
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: 0,
              child: Transform(
                transform: Matrix4.skew(0.8,0.1),
                child: Transform.translate(
                  offset: const Offset(100, -130),
                  child: Container(
                    height: 100,
                    width: 250,
                    decoration:  const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("N",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                        Text("S",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
