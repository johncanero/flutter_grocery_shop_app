import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  // final Strings
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;

  const GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Image.asset(
              imagePath,
            ),
          ),


          // item name

          // price + button
        ],
      ),
    );
  }
}
