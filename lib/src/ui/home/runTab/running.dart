import 'package:flutter/material.dart';

class Running extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {
  TextStyle textStyle = TextStyle(fontSize: 30.0, color: Colors.black);
  Stopwatch stopwatch = Stopwatch();

  void pauseButtonPressed() {
    setState(() {
      stopwatch.stop();
    });
  }

  void stopButtonPressed() {
    setState(() {
      stopwatch.reset();
    });
  }

  void restartButtonPressed() {
    setState(() {
      stopwatch.start();
    });
  }

  Widget buildIconButton(Icon icon, VoidCallback callback) {
    return IconButton(
      icon: icon,
      onPressed: callback,
      iconSize: 50.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 250.0),
              ),
              Text(
                'Stopwatch Section',
                style: textStyle,
              ),
//          stopwatchSection(),
              Container(height: 70.0),
              Text('Distance Section', style: textStyle),
//            distanceSection(),
              Container(height: 200.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  stopwatch.isRunning
                      ? buildIconButton(Icon(Icons.pause), pauseButtonPressed)
                      : buildIconButton(Icon(Icons.stop), stopwatchSection),
                  Container(
                    width: 20.0,
                  ),
                  buildIconButton(Icon(Icons.play_arrow), restartButtonPressed),
//                buildIconButton(Icon(Icons.play_circle_filled), restartButtonPressed),
                ],
              ),
//          buttonSection(),
            ],
          ),
        ),
      ),
    );
  }

  stopwatchSection() {
    Text("dfdfi");
  }

  buttonSection() {
    Text("dfdfi");
  }
}
