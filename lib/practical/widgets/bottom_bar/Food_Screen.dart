import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:swiggy/models/Dishes_Model.dart';
import 'package:swiggy/practical/widgets/Constant_Variable.dart';
import 'package:swiggy/view/utils/config/app_images.dart';
import 'package:swiggy/view/utils/widgets/common_widgets/list_view_model.dart';

import '../../../models/modelData.dart';

class Food_Screen extends StatefulWidget {
  const Food_Screen({super.key});

  @override
  State<Food_Screen> createState() => _Food_ScreenState();
}

class _Food_ScreenState extends State<Food_Screen> {
  List<ModelData> dataList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      String jsonString = await rootBundle.rootBundle.loadString(
          "jsonData/data.json");
      List<dynamic> jsonList = json.decode(jsonString);
      setState(() {
        dataList = jsonList.map((json) => ModelData.fromJson(json)).toList();
      });
    } catch (e) {
      log("Eroor loading json data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(CupertinoIcons.location_fill,
              color: Colors.deepOrange),
          title: const Text("location", style: TextStyle(color: Colors.black)),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                              style: TextStyle(
                                  color: Color(0xff9D9690), fontSize: 23),
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
                                            color: Colors.black,
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
                        padding: const EdgeInsets.only(right: 10),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: RichText(
                        text: TextSpan(
                            text: Username,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                            children: const [
                              TextSpan(text: "what's on your mind?")
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: size.height / 4,
                      width: size.width,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: DishesPic.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 8,
                                childAspectRatio: .9),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: size.height / 10.4,
                                  width: size.width / 4,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              DishesPic[index].background),
                                          fit: BoxFit.cover)),
                                ),
                                Text(DishesPic[index].Text),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height / 25,
                    ),
                    TabBar(
                        automaticIndicatorColorAdjustment: false,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        indicator: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        isScrollable: true,
                        tabs: [
                          Container(
                            height: size.width / 12,
                            width: size.width / 4,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.transparent,
                            )),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Tab(
                                  text: "Filter",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.width / 10,
                            width: size.width / 5,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.transparent,
                            )),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showMenu(
                                        context: context,
                                        position: const RelativeRect.fromLTRB(
                                            60, 600, 60, 60),
                                        items: [
                                          const PopupMenuItem(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Relevance (Default)",
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            child: Row(
                                              children: [
                                                Text("Delivery Time"),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                // Radio(
                                                //     value: 1,
                                                //     groupValue: 1,
                                                //     onChanged: (value) {}),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            child: Row(
                                              children: [
                                                Text("Rating"),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            child: Row(
                                              children: [
                                                Text("Cost: Low to High"),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            child: Row(
                                              children: [
                                                Text("Cost: High Low to"),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]);
                                  },
                                  child: const Tab(
                                    text: "Sort by",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.width / 10,
                            width: size.width / 4,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.transparent,
                            )),
                            child: const Tab(
                              text: "Fast Delivery",
                            ),
                          ),
                          SizedBox(
                            height: size.width / 10,
                            width: size.width / 5,
                            child: const Tab(
                              text: "Cuisines",
                            ),
                          ),
                          Container(
                            height: size.width / 10,
                            width: size.width / 3.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.transparent,
                            )),
                            child: const Tab(
                              text: "New on Swiggy",
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: size.height / 50,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "To many restaurant to explore",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      width: size.width/1.1,
                      child: ListView.builder(
                        itemCount: dataList.length,
                        itemExtent: 250,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < dataList.length) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 250,
                                width: size.width,
                                alignment: Alignment.center,
                                color: Colors.black,
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  leading: Container(
                                    width: size.width/2.7,
                                    height: 230,
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          dataList[index].image!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    dataList[index].title!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    dataList[index].location!,
                                    style:
                                    const TextStyle(color: Colors.black),
                                  ),
                                  trailing: const Icon(
                                      Icons.next_plan_outlined,
                                      color: Colors.white70,
                                      size: 25),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),


                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    }
  }
