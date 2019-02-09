import 'package:flutter/material.dart';
import '../blocs/bloc_provider.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
// signout button
          onPressed: () => BlocProvider.of(context).authBloc.setLoggedIn(false),
          child: Text("Sign Out"),
          color: Colors.red,
        ),
      ),
    );
  }
}
