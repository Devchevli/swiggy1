import 'package:flutter/material.dart';

import '../../../../../view/utils/widgets/common_widgets/list_view_model.dart';

Widget preBookOffer(){
  return ListView.builder(
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
  );
}