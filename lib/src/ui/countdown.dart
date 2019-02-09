import 'package:flutter/material.dart';
import 'dart:async';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inSeconds % 60 + 1).toString().padLeft(1, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    reverseTimer();
    Timer(controller.duration, running);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              return Text(
                timerString,
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void running(){

  }

  void reverseTimer() {
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    print("end");
  }
}
