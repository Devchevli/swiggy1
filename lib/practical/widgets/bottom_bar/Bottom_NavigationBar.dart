import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swiggy/practical/widgets/bottom_bar/Dineout_Screen.dart';
import 'package:swiggy/practical/widgets/bottom_bar/Food_Screen.dart';
import 'package:swiggy/practical/widgets/bottom_bar/Genie_Screen.dart';
import 'package:swiggy/practical/widgets/bottom_bar/Home_Screen.dart';
import 'package:swiggy/practical/widgets/bottom_bar/Instamart_Screen.dart';

class Bottom_NavigationBar_Screen extends StatefulWidget {
  const Bottom_NavigationBar_Screen({super.key});

  @override
  State<Bottom_NavigationBar_Screen> createState() =>
      _Bottom_NavigationBar_ScreenState();
}

class _Bottom_NavigationBar_ScreenState
    extends State<Bottom_NavigationBar_Screen> {
  int activeindex = 0;
  int currentPageIndex = 0;
  List<Widget> screens = [
    const Home_Screen(),
    const Food_Screen(),
    const Instamart(),
    Dineout_Screen(),
    const GeniePage()
  ];

  Widget showScreens(int index) {
    return screens[index];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            activeindex = index;
          });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: activeindex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fastfood_sharp),
            icon: Icon(Icons.fastfood_outlined),
            label: 'Food',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.local_grocery_store_sharp),
            icon: Icon(Icons.local_grocery_store_outlined),
            label: 'Instamart',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.cookie_sharp),
            icon: Icon(Icons.cookie_outlined),
            label: 'Dineout',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_sharp),
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
        ],
      ),
      body: showScreens(activeindex),
    );
  }
}
