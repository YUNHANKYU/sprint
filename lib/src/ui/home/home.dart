import 'package:flutter/material.dart';
import 'lotto.dart';
import 'my_record.dart';
import 'running.dart';
import 'challenge.dart';
import 'mypage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 2;


  Color iconDefault = Colors.grey;
  Color iconSelected = Colors.purple;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      new Lotto(), //응모함
      new MyRecord(), //나의 기록
      new Running(), //런닝
      new Challenge(),  //챌런지
      new MyPage()  //마이페이지
    ];
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
//              _uid = widget.uid;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money, color: _currentIndex == 0 ? iconSelected : iconDefault),
              title: Text("Lotto", style: TextStyle(color: iconSelected),),),
            BottomNavigationBarItem(
              icon: Icon(Icons.straighten, color: _currentIndex == 1 ? iconSelected : iconDefault),
              title: Text("My Record",style: TextStyle(color: iconSelected), ),),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_run, color: _currentIndex == 2 ? iconSelected : iconDefault),
              title: Text("Running", style: TextStyle(color: iconSelected),),),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag, color: _currentIndex == 3 ? iconSelected : iconDefault),
              title: Text("Challenge", style: TextStyle(color: iconSelected),),),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _currentIndex == 4 ? iconSelected : iconDefault),
              title: Text("My Page",style: TextStyle(color: iconSelected),),),
          ]),
    );
  }

}




