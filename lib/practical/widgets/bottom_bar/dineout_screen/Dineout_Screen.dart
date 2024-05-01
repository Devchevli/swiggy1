import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swiggy/practical/widgets/bottom_bar/dineout_screen/widget/explore_resturant_list.dart';
import 'package:swiggy/practical/widgets/bottom_bar/dineout_screen/widget/prebooking_offer.dart';
import 'package:swiggy/practical/widgets/bottom_bar/dineout_screen/widget/trending_list_view.dart';

import '../../../../view/utils/config/app_images.dart';

class DineOutScreen extends StatefulWidget {
  const DineOutScreen({super.key});

  @override
  State<DineOutScreen> createState() => _DineOutScreenState();
}

class _DineOutScreenState extends State<DineOutScreen> {
  int activeIndex = 0;
  List<String> items = [
    AppImages.hdfcBank,
    AppImages.americanExpress,
    AppImages.simpl,
  ];
  List<String> txt = [
    "Upto 15% Discount Using HDFC Bank Credit Cards",
    "10% Discount Using American Express Next work Cards",
    "10% Discount Using Simple"
  ];

  List<String> hotel = [
    AppImages.Paratha,
    AppImages.Paratha,
    AppImages.Paratha,
    AppImages.Paratha,
  ];

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
                  // search box
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
                        hintText: 'search for mall & landmarks ',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // swiggy image dineout
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.00, end: 1),
                    duration: const Duration(seconds: 3),
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
                  const SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                      items: [
                        for (int index = 0; index < items.length; index++)
                          Row(
                            children: [
                              Image.network(
                                items[index],
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                txt[index],
                                style: const TextStyle(fontSize: 10),
                              )
                            ],
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
                        trendingListview(),
                        preBookOffer(),
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
                  resturantExplore(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//