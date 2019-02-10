import 'package:flutter/material.dart';
import '../../../blocs/bloc_provider.dart';
import '../../../models/elapsed_time.dart';
import '../../../blocs/run_bloc.dart';


class Running extends StatelessWidget {
  TextStyle textStyle = TextStyle(fontSize: 30.0, color: Colors.black);


  Widget buildIconButton(Icon icon, VoidCallback callback) {
    return IconButton(
      icon: icon,
      onPressed: callback,
      iconSize: 50.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final RunBloc runBloc = BlocProvider.of(context).runBloc;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 250.0),
              ),
              StreamBuilder( //runBloc의 스톱워치시간을 구독하면서 그 값으로 변경한다.
                  stream: BlocProvider.of(context).runBloc.elapsedTime,
                  builder: (context, AsyncSnapshot<ElapsedTime> snapshot) {
                    return Container(
                      child: Text("${snapshot.data.minutes} : ${snapshot.data.seconds}"),
                    );
                  }),
              Container(height: 70.0),
              Text('Distance Section', style: textStyle),
              Container(height: 200.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder(
                    stream: BlocProvider.of(context).runBloc.elapsedTime,
                    builder: (context, AsyncSnapshot<ElapsedTime> snapshot) {
                      snapshot.data.isRunning ?
                        buildIconButton(Icon(Icons.pause), runBloc.pauseButtonPressed)
                      :
                      buildIconButton(Icon(Icons.stop), runBloc.stopButtonPressed);
                      Container(
                        width: 20.0,
                      );
                      buildIconButton(Icon(Icons.play_arrow), runBloc.stopButtonPressed);
                    }
                  ),
//                  Container(
//                    width: 20.0,
//                  ),
//                  buildIconButton(Icon(Icons.play_arrow), restartButtonPressed),
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
}
