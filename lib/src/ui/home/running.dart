import 'package:flutter/material.dart';

class Running extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text("Running!!"),
      ),
    );
  }
}
