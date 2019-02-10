import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RunBloc extends Object {
  final _loggedIn = StreamController<bool>.broadcast();

  Stream<bool> get loggedIn => _loggedIn.stream;

  Function(bool) get setLoggedIn => _loggedIn.sink.add;

  dispose() {
    _loggedIn.close();
  }


}
