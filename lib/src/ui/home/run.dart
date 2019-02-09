import 'package:flutter/material.dart';
import '../countdown.dart';

class Running extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Countdown())),
        child: Text("Start"),
      ),
    );
  }
}
