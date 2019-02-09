import 'package:flutter/material.dart';
import '../ui/home.dart';


class MyNavigator {
//  static void goToLoginPage(BuildContext context) {
//    Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (BuildContext context) => new LoginPage()), ModalRoute.withName('/login'));
//  }
//  static void goToRequestPage(BuildContext context, String uid){
//    Navigator.push(context, MaterialPageRoute(builder: (context) => RequestFood(uid: uid)));
//  }
  static void goToHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (BuildContext context) => Home()), ModalRoute.withName('/home'));
  }
//  static void goToInitProfilePage(BuildContext context) {
//    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => InitProfile()), ModalRoute.withName('/initprofile'));
//  }
}