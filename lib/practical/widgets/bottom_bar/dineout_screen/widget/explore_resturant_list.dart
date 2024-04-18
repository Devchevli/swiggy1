import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../view/utils/widgets/common_widgets/carousal_list.dart';

Widget resturantExplore(BuildContext context) {
  final size = MediaQuery.of(context).size;
  int activeIndex = 0;
  return SizedBox(
    width: size.width / 1.1,
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                              fit: BoxFit.cover,
                            ),
                          ),

                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    initialPage: activeIndex,
                    onPageChanged: (i, r) {
                      activeIndex = i;
                      // setState(() {});
                    },
                    viewportFraction: 1,
                    height: size.height / 2.9,
                    // Adjust height of the carousel
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(hotledetails[index].title,
                      style: const TextStyle(
                          color: Colors.black,
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
                              hotledetails[index].rating,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      hotledetails[index].type,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        hotledetails[index].rupees,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Text(
                  hotledetails[index].location,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 15,),
                Container(
                  height: 35,

                  decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hotledetails[index].flatoff,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
