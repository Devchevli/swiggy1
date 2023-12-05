

import 'package:flutter/material.dart';
import 'package:swiggy/practical/widgets/Constant_Variable.dart';

import 'OTP_Screen.dart';
import 'location.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({super.key});

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
                crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text(
                "Congratulations\t\t",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                Username,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Your welcome gift is unlocked!",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
          ),
          const SizedBox(
            height: 55,
          ),
          Container(
            height: size.height/2.5,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/Screenshot 2023-11-30 100251.png")),
              color: Colors.black
            ),
          ),
          SizedBox(
            height: size.height/3,
          ),
          ElevatedButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const Location_page() ));},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                fixedSize: MaterialStateProperty.all(const Size(400, 45))),
            child: const Text("Explore Swiggy", style: TextStyle(fontSize: 17)),
          ),
        ],
      ),


    );
  }
}
