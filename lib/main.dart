import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiggy/practical/widgets/Constant_Variable.dart';
import 'package:swiggy/practical/widgets/OTP_Screen.dart';
import 'package:swiggy/practical/widgets/Splash_Screen/splash_Screen.dart';
import 'package:swiggy/practical/widgets/Third_Screen.dart';
import 'package:swiggy/practical/widgets/Confirm_Details_Pages.dart';
import 'package:swiggy/practical/widgets/Welcome_Pages.dart';
import 'package:swiggy/practical/widgets/bottom_bar/Bottom_NavigationBar.dart';
import 'package:swiggy/practical/widgets/bottom_bar/Home_Screen.dart';
import 'package:swiggy/practical/widgets/location.dart';
import 'package:swiggy/practical/widgets/second_Screen.dart';

import 'demo/app_bottom.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref=await SharedPreferences.getInstance();
  Username =pref.getString("Username") ?? "";
  print("Username:$Username");
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom_NavigationBar_Screen(),

    );
  }
}
