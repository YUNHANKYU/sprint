import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RunBloc extends Object {
  final _paused = StreamController<bool>.broadcast();

  Stream<bool> get paused => _paused.stream;

  Function(bool) get setPaused => _paused.sink.add;

  dispose() {
    _paused.close();
  }


}
