import 'dart:async';
import '../resources/firebase_auth.dart';

enum Gender { male, female }

class AuthBloc extends Object {
  final _firebaseAuth = FirebaseAuthentication();
  final _loggedIn = StreamController<bool>.broadcast();
  final _doneLoading = StreamController<bool>.broadcast();

  Stream<bool> get loggedIn => _loggedIn.stream;

  Stream<bool> get doneLoading => _doneLoading.stream;

  Function(bool) get setLoggedIn => _loggedIn.sink.add;

  Function(bool) get setLoading => _doneLoading.sink.add;

  void googleSignIn() {
    _firebaseAuth.signIn();
  }

  void signOut(){
    _firebaseAuth.signOut();
    checkAuth();
  }

  Future<void> checkAuth() async {
    print("AuthBloc checkAuth start");
    if (await _firebaseAuth.getFirebaseUser() != null) {
      print("AuthBloc checkAuth true");
      setLoading(false);
      setLoggedIn(true);
    } else {
      print("AuthBloc checkAuth false");
      setLoggedIn(false);
    }
  }

  AuthBloc() {
    init();
  }

  init() async {
    print('auth bloc init');
    await Future.delayed(Duration(seconds: 2));
    setLoading(true);
  }

  dispose() {
    _loggedIn.close();
    _doneLoading.close();
  }
}
