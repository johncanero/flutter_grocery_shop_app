import 'package:flutter/material.dart';
import 'package:flutter_grocery_shop_app/components/grocery_item_tile.dart';
import 'package:flutter_grocery_shop_app/model/cart_model.dart';
import 'package:flutter_grocery_shop_app/pages/cart_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            // good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Morning!"),
            ),

            const SizedBox(
              height: 4.0,
            ),

            // Let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24.0),

            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 4.0,
              ),
            ),

            const SizedBox(height: 24.0),

            // fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16.0),
              ),
            ),

            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.30),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
