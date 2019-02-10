import 'package:flutter/material.dart';
import '../blocs/bloc_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () => signIn(),
          child: Text("Google Sign In"),
          color: Colors.green,
        ),
      ],
    );
  }

  void signIn(){
    BlocProvider.of(context).authBloc.googleSignIn();
  }
}
