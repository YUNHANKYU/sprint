import 'package:flutter/material.dart';
import 'dart:async';
import 'home/runTab/running.dart';

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
    Timer(controller.duration, goRunning);
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
                style: TextStyle(
                  fontSize: 100,
                ),
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

  void goRunning(){
    print("gogo");
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Running()));
  }

  void reverseTimer() {
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    print("end");
  }
}
