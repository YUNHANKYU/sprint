import 'package:flutter/material.dart';
import 'current_running.dart';
import 'package:quiver/async.dart';

//class Timer extends StatefulWidget {
//  @override
//  _TimerState createState() => _TimerState();
//}
//
//class _TimerState extends State<Timer> with TickerProviderStateMixin {
//  AnimationController controller;
//
//  String get timerString {
//    Duration duration = controller.duration * controller.value;
//    return '${(duration.inSeconds % 60 + 1).toString().padLeft(1, '0')}';
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    controller = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 3),
//    );
//    reverseTimer();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: AnimatedBuilder(
//            animation: controller,
//            builder: (BuildContext context, Widget child) {
//              return controller.isAnimating ? Text(
//                timerString,
//              )
//              :
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => CurrentRunning()));
//            }),
//      ),
//    );
//  }
//
//  reverseTimer() {
//    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
//  }
//}
