import 'package:flutter/material.dart';
import '../ui/home/home.dart';
import '../ui/login.dart';
import '../blocs/bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of(context).authBloc.loggedIn,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
            child: Center(child: Text(
              'Sprint',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                decorationStyle: TextDecorationStyle.solid,
              ),
            )),
          );
        }
        else if(snapshot.data){
          return Home();
        }else{
          return LoginScreen();
        }
      },
    );
  }

  _checkAuth() async {
    print("checkauth!!!");
    await Future.delayed(Duration(seconds: 3));
    BlocProvider.of(context).authBloc.checkAuth();
  }
}
