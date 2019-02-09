import 'package:flutter/material.dart';
import 'timer.dart';

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
                builder: (context) => Timer())),
        child: Text("Start"),
      ),
    );
  }
}
