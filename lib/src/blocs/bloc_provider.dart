import 'package:flutter/material.dart';
import '../blocs/auth_bloc.dart' show AuthBloc;
import '../blocs/run_bloc.dart' show RunBloc;

abstract class BlocBase {
  void dispose();
}

class BlocProvider extends InheritedWidget {
  final blocState = new _BlocState(
      authBloc: AuthBloc(),
      runBloc: RunBloc()
  );

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static _BlocState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .blocState;
  }
}

class _BlocState {
  final AuthBloc authBloc;
  final RunBloc runBloc;

  _BlocState({this.authBloc, this.runBloc});
}
