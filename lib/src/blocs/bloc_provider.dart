import 'package:flutter/material.dart';
import '../blocs/auth_bloc.dart' show AuthBloc;
import '../blocs/login_bloc.dart' show LoginBloc;

class BlocProvider extends InheritedWidget {
  final blocState = new _BlocState(
    authBloc: AuthBloc(),
    loginBloc: LoginBloc()
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
  final LoginBloc loginBloc;

  _BlocState({
    this.authBloc,
    this.loginBloc
  });
}