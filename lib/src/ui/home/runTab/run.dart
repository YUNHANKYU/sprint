import 'package:flutter/material.dart';
import '../../countdown.dart';

class Run extends StatelessWidget {
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
