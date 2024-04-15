import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swiggy/view/utils/widgets/common_widgets/carousal_list.dart';
import 'package:swiggy/view/utils/widgets/common_widgets/list_view_model.dart';
import '../../../view/utils/config/app_images.dart';
import '../Constant_Variable.dart';

class Dineout_Screen extends StatefulWidget {
  Dineout_Screen({super.key});

  List<String> items = [
    AppImages.hdfcBank,
    AppImages.americanExpress,
    AppImages.simpl,
  ];
  List<String> txt = [
    "Upto 15% Discount Using HDFC Bank Credit Cards",
    "10% Discount Using American Express Nextwork Cards",
    "10% Discount Using Simpl"
  ];

  List<String> hotel = [
    AppImages.Paratha,
    AppImages.Paratha,
    AppImages.Paratha,
    AppImages.Paratha,
  ];

  @override
  State<Dineout_Screen> createState() => _Dineout_ScreenState();
}

class _Dineout_ScreenState extends State<Dineout_Screen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          scrollBehavior: const MaterialScrollBehavior(),
          slivers: [
            SliverAppBar(
                floating: true,
                backgroundColor: Colors.white,
                pinned: true,
                snap: false,
                leading: const Icon(CupertinoIcons.location_fill,
                    color: Colors.deepOrange),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ClipOval(
                      child: Container(
                        height: size.height / 18,
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        hintText: 'searh for mall & landmarks ',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.00, end: 1),
                    duration: Duration(seconds: 3),
                    builder: (BuildContext context, double value, child) {
                      return Opacity(
                        opacity: value,
                        child: Container(
                          height: size.height / 4,
                          width: size.width / 1.1,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(AppImages.dineout),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xffFFEEE6),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                      items: [
                        for (int index = 0;
                            index < widget.items.length;
                            index++)
                          Container(
                            child: Row(
                              children: [
                                Image.network(
                                  widget.items[index],
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  widget.txt[index],
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          )
                      ],
                      options: CarouselOptions(
                          initialPage: activeIndex,
                          onPageChanged: (i, r) {
                            activeIndex = i;
                            setState(() {});
                          },
                          viewportFraction: .90,
                          height: 30,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.easeInSine)),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "WHAT'S HOT ON DINEOUT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TabBar(
                    automaticIndicatorColorAdjustment: false,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    isScrollable: true,
                    tabs: [
                      // Container(
                      //   height: size.width / 20,
                      //   width: size.width / 2.5,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //     color: Colors.transparent,
                      //   )),
                      //   child: const Tab(
                      //     text: "Iconic Place @ GIRF ",
                      //   ),
                      // ),
                      Container(
                        height: size.width / 10,
                        width: size.width / 2.5,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.transparent,
                        )),
                        child: const Tab(
                          text: "Trending Restaurant",
                        ),
                      ),
                      SizedBox(
                        height: size.width / 10,
                        width: size.width / 2.5,
                        child: const Tab(
                          text: "Pre Book Offers",
                        ), //
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 350,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          // trending restaurant
                          scrollDirection: Axis.horizontal,
                          itemCount: details.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  width: 380,
                                  margin: const EdgeInsets.all(5),
                                  foregroundDecoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(.0),
                                        Colors.black.withOpacity(0.8),
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(details[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 380,
                                  width: 380,
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          details[index].title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                CupertinoIcons.star_circle,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 20),
                                                child: Text(
                                                  details[index].rating,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),
                                ),

                              ],
                            );
                          },
                        ),
                        ListView.builder(
                          // pre book offers
                          scrollDirection: Axis.horizontal,
                          itemCount: details.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 300,
                              color: Colors.white,
                              child: Container(
                                width: 380,
                                margin: const EdgeInsets.all(5),
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(12.0)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(.0),
                                      Colors.black.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                                // decoration: BoxDecoration(
                                //   boxShadow: [
                                //     BoxShadow(
                                //       color: Colors.black.withOpacity(0.5), // Inner shadow color
                                //       blurRadius: 7,
                                //       offset: Offset(0, 3),
                                //     ),
                                //   ],
                                // ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(details.reversed
                                          .toList()[index]
                                          .image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Text(
                                    details.reversed.toList()[index].title,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "To Many restaurant to explore",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              CarouselSlider(
                                items: hotledetails[index].image.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(i),
                                                fit: BoxFit.cover)),
                                        // Adjust width of the carousel item
                                        child: const Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                                // [
                                //   Container(
                                //     width: size.width,
                                //     decoration: BoxDecoration(
                                //         image: DecorationImage(
                                //             image: NetworkImage(
                                //                 hotledetails[index].image[0]),
                                //             fit: BoxFit.cover)),
                                //     // Adjust width of the carousel item
                                //     child: const Row(
                                //       children: [
                                //         SizedBox(
                                //           width: 20,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ],
                                options: CarouselOptions(
                                  initialPage: activeIndex,
                                  onPageChanged: (i, r) {
                                    activeIndex = i;
                                    setState(() {});
                                  },
                                  viewportFraction: 1,
                                  height: size.height / 2.9,
                                  // Adjust height of the carousel
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                ),
                              ),
                              SizedBox(
                                height: 200,
                                child: Text(hotledetails[index].title),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
