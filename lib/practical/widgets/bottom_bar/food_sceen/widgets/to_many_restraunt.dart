import 'package:flutter/material.dart';
import '../../../../../models/modelData.dart';

Widget manyrestraunt(BuildContext context, List<ModelData> dataList) {
  final size = MediaQuery.of(context).size;

  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount: dataList.length,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      if (index < dataList.length) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(dataList[index].image!),
                      opacity: .8,
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        dataList[index].discount!,
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        dataList[index].upto!,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataList[index].restratype!,
                      style: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    Text(
                      dataList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),
                    Text(
                      dataList[index].rating!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    Text(
                      dataList[index].items!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    Text(
                      dataList[index].location!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    },
  );
}
