import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swiggy/practical/widgets/Constant_Variable.dart';
import 'package:swiggy/view/utils/config/app_images.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: const MaterialScrollBehavior(),
        slivers: [
          SliverAppBar(
              floating: true,
              backgroundColor: Colors.white,
              pinned: false,
              snap: true,
              leading: const Icon(CupertinoIcons.location_fill,
                  color: Colors.deepOrange),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipOval(
                    child: Container(
                      height: size.height/18,
                      width: size.width / 7,
                      color: Colors.grey,
                      child: const Icon(Icons.person),
                    ),
                  ),
                ),
              ],
              title: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "area or location etc..etc..",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              expandedHeight: size.height / 10),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    onTap: () {},
                    cursorColor: Colors.black54,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      hintText: 'Dishes,restaurants,groceries & more',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: size.height / 10,
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(AppImages.Partyemoji),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(
                        text: "Welcome\t",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                        text: Username,
                      ),
                      const TextSpan(
                          text: "\nFLAT 50% OFF + FREE DELIEVERY",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300))
                    ])),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: size.height / 6,
                    width: size.width,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 20, color: Colors.grey),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ORDER FOOD",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: size.height / 120,
                              ),
                              const Text(
                                "FROM GREAT RESTAURANTS \nNEAR YOU",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: size.height / 50,
                              ),
                              Container(
                                height: size.height / 25,
                                width: size.width / 4.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    border: Border.all(
                                        color: Colors.red, width: 3)),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "30-40\t",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Mins",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width / 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: size.height / 8,
                              width: size.width / 3.5,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  image: DecorationImage(
                                      image: NetworkImage(AppImages.Burgerking),
                                      fit: BoxFit.cover)),
                            ),
                            const Text("Burger King",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: size.height / 6,
                    width: size.width,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 20, color: Colors.grey),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ORDER GROCERIES",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: size.height / 120,
                              ),
                              const Text(
                                "DAILY ESSENTIAL DELIVERED\n FAST!",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: size.height / 50,
                              ),
                              Container(
                                height: size.height / 25,
                                width: size.width / 4.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    border: Border.all(
                                        color: Colors.red, width: 3)),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "12-15\t",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Mins",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width / 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: size.height / 8,
                              width: size.width / 3.5,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: NetworkImage(AppImages.Lays))),
                            ),
                            const Text("Lays",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Container(
                        height: size.height / 10,
                        width: size.width / 2.5,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5)
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "DINEOUT",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: size.height / 120,
                                ),
                                const Text(
                                  "EAT OUT & SAVE",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              height: size.height / 15,
                              width: size.width / 8,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(21)),
                                  image: DecorationImage(
                                      image: NetworkImage(AppImages.Dishes),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 25),
                      Container(
                        height: size.height / 10,
                        width: size.width / 2.5,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5)
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "GENIE",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: size.height / 120,
                                ),
                                const Text(
                                  "PICK UP & DROP",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              height: size.height / 15,
                              width: size.width / 8,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(21)),
                                  image: DecorationImage(
                                      image: NetworkImage(AppImages.Box),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                Container(
                  height: 500,
                  width: size.width,
                  child: Image.network(AppImages.GiftBox,fit: BoxFit.fitWidth,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
