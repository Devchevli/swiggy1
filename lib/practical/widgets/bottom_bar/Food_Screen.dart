import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swiggy/practical/widgets/Constant_Variable.dart';
import 'package:swiggy/view/utils/config/app_images.dart';

class Food_Screen extends StatefulWidget {
  const Food_Screen({super.key});

  @override
  State<Food_Screen> createState() => _Food_ScreenState();
}

class _Food_ScreenState extends State<Food_Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
            const Icon(CupertinoIcons.location_fill, color: Colors.deepOrange),
        title: const Text("location", style: TextStyle(color: Colors.black)),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              height: size.height / 4,
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Color(0xffFFEEE6),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25, top: 25),
                        child: Text(
                          "Welcome to Swiggy",
                          style:
                              TextStyle(color: Color(0xff9D9690), fontSize: 23),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10),
                        child: RichText(
                          text: const TextSpan(
                              text: "Enjoy ",
                              style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: "Free delivery &\n50% OFF ",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: "on your\nfirst order ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w500)),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Container(
                      height: size.height / 6,
                      width: size.width / 4,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(AppImages.GiftBox),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: Username,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        children: const [
                      TextSpan(text: " what's on your mind?")
                    ]
                    ),
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}
