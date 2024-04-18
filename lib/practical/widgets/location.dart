import 'package:flutter/material.dart';
import 'package:swiggy/view/utils/config/app_images.dart';

import 'bottom_bar/Bottom_NavigationBar.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("What's your location?",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            const Text(
                "We need your location to show available restaurants & products",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: size.height / 1.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(AppImages.Location),
                fit: BoxFit.cover,
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Bottom_NavigationBar_Screen()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                  fixedSize: MaterialStateProperty.all(const Size(400, 45))),
              child: const Text("Allow Location Access",
                  style: TextStyle(fontSize: 20,color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {

              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                  fixedSize: MaterialStateProperty.all(const Size(400, 45))),
              child: const Text("Enter Location Manually",
                  style: TextStyle(fontSize: 17, color: Colors.deepOrange)),
            ),
          ],
        ),
      ),
    );
  }
}
