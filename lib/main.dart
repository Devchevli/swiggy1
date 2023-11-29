import 'package:flutter/material.dart';
import 'package:swiggy/practical/widgets/Splash_Screen/splash_Screen.dart';
import 'package:swiggy/practical/widgets/Third_Screen.dart';
import 'package:swiggy/practical/widgets/second_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Second_Screen(),

    );
  }
}
