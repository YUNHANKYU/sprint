import 'package:flutter/material.dart';
import 'dart:async';
import '../models/elapsed_time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Dependencies {
  final List<ValueChanged<ElapsedTime>> timerListeners = <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle = const TextStyle(fontSize: 90.0, fontFamily: "Bebas Neue");
  final Stopwatch stopwatch = new Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
}

class RunBloc extends Object {
  final _elapsedTime = StreamController<ElapsedTime>.broadcast();
  final _dependencies = StreamController<Dependencies>.broadcast();

  Timer timer;
  final Dependencies dependencies = new Dependencies();
  int milliseconds;
  ElapsedTime finalTime;


  Stream<ElapsedTime> get elapsedTime => _elapsedTime.stream;
  Stream<Dependencies> get dependency => _dependencies.stream;

  Function(ElapsedTime) get setElapsedTime => _elapsedTime.sink.add;
  Function(Dependencies) get setDependency => _dependencies.sink.add;

  dispose() {
    timer?.cancel();
    timer = null;
    _elapsedTime.close();
    _dependencies.close();
  }


  RunBloc(){
    timer = new Timer.periodic(new Duration(milliseconds: dependencies.timerMillisecondsRefreshRate), callback);
  }

  void callback(Timer timer){
    if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final ElapsedTime elapsedTime = new ElapsedTime(
        hundreds: hundreds.toString(),
        seconds: seconds.toString(),
        minutes: minutes.toString(),
      );

      for (final listener in dependencies.timerListeners) {
        listener(elapsedTime);
        setElapsedTime(elapsedTime);
      }
    }
  }


  void pauseButtonPressed() {
      dependencies.stopwatch.stop();
  }

  void stopButtonPressed() {
      dependencies.stopwatch.reset();
  }

  void startButtonPressed() {
    dependencies.stopwatch.start();
  }



}
