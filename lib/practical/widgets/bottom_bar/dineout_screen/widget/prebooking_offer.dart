
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../view/utils/widgets/common_widgets/list_view_model.dart';

Widget preBookOffer() {
  return ListView.builder(
    // trending restaurant
    scrollDirection: Axis.horizontal,
    itemCount: details.length,
    itemBuilder: (context, index) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.transparent,
            width: 380,
            margin: const EdgeInsets.all(5),
            foregroundDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
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
                  image: NetworkImage(details.reversed.toList()[index].image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Container(
              width: 380,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          details.reversed.toList()[index].title,
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
                                  details.reversed.toList()[index].rating,
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
                    Row(
                      children: [
                        Text(
                          details.reversed.toList()[index].type,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            details.reversed.toList()[index].rupees,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          details.reversed.toList()[index].location,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            details.reversed.toList()[index].km,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: 35,
              width: 360,
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    details.reversed.toList()[index].flatoff,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

