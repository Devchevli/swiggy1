import 'package:carousel_slider/carousel_slider.dart';
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
                            fit: BoxFit.cover,
                          ),
                        ),
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
              SizedBox(
                height: 200,
                child: Text(hotledetails[index].title),
              ),
            ],
          ),
        );
      },
    ),
  );
}
