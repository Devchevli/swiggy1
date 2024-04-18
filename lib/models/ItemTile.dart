
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: CupertinoColors.white,
            boxShadow: const [
              BoxShadow(color: Colors.black, blurRadius: 1.4)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // item image
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
              child: Image.network(
                imagePath,
                height: 110,
              ),
            ),

            // item name
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: MaterialButton(
                onPressed: onPressed,
                color: color,
                child: Text(
                  '\$' + itemPrice,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}