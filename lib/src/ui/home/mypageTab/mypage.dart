import 'package:flutter/material.dart';
import '../../../blocs/bloc_provider.dart';

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
          onPressed: () => signOut(),
          child: Text("Sign Out"),
          color: Colors.red,
        ),
      ),
    );
  }

  void signOut() {
    BlocProvider.of(context).authBloc.signOut();
  }
}
