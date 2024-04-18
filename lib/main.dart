import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiggy/models/CartModel.dart';
import 'package:swiggy/practical/widgets/Constant_Variable.dart';
import 'package:swiggy/practical/widgets/bottom_bar/Bottom_NavigationBar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  Username = pref.getString("Username") ?? "";
  print("Username:$Username");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Bottom_NavigationBar_Screen(),
      ),
    );
  }
}
