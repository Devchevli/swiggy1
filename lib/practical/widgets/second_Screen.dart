import 'package:flutter/material.dart';
import 'package:swiggy/view/utils/config/app_images.dart';

import 'Third_Screen.dart';

class Second_Screen extends StatefulWidget {
  const Second_Screen({super.key});

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(AppImages.SecondScreenPic),
                fit: BoxFit.cover,
                opacity: .5)),
        child: Container(
          margin: const EdgeInsets.only(left: 25, bottom: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Swiggy",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 43,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    "Food",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 10,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Instamart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 10,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Dineout",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.white,
                height: 13,
                thickness: 2,
              ),
              const Text(
                "Order from top restaurants",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Third_Screen()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrange),
                    fixedSize: MaterialStateProperty.all(const Size(400, 45))),
                child:
                    const Text("Get Started", style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
