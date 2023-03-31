import 'dart:html';
import 'My_favorites.dart';
import 'Home.dart';
import 'Search.dart';
import 'My_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => BottomSetting();
}


class BottomSetting extends State<Page> {

  int selected = 0;
  List<Widget> PageList = <Widget>[
    Home(),
    My_favorites(),
    Search(),
    My_Page(),
  ];
  void Tapped(int index){
    setState(() {
      selected = index;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          titleTextStyle: TextStyle(
              fontFamily: 'Sunflower',
              fontSize: 20,
              fontWeight: FontWeight.w700
              ),
          title: Text('모두 칼로리'),
        ),
        body: SafeArea(
          child: PageList.elementAt(selected),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: '즐겨찾기'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '레시피검색'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '마이페이지'
            ),
          ],
          currentIndex: selected,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          onTap: Tapped,
        ),
      ),
    );
  }
}
