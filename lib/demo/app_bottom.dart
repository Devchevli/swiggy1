import 'package:flutter/material.dart';
import 'package:swiggy/demo/screen_one.dart';
import 'package:swiggy/demo/screen_three.dart';
import 'package:swiggy/demo/screen_two.dart';

class AppBottom extends StatefulWidget {
  const AppBottom({super.key});

  @override
  State<AppBottom> createState() => _AppBottomState();
}

class _AppBottomState extends State<AppBottom> {
  int activeIndex=0;

  List<Widget> screens=[
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ];

  Widget showScreen(int index){
    return screens[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          activeIndex=index;
          setState(() {});
          print(index.toString());
        },

          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.chat),label: "chat"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
      ]),
      body: showScreen(activeIndex),
    );
  }
}
