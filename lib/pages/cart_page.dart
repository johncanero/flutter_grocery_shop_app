import "package:flutter/material.dart";
import "package:flutter_grocery_shop_app/model/cart_model.dart";
import "package:provider/provider.dart";
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[800]),
      ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "My Cart",
                style: GoogleFonts.montserrat(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // list view of cart
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: const EdgeInsets.all(12.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0)),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index][2],
                            height: 36.0,
                          ),
                          title: Text(
                            value.cartItems[index][0],
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          subtitle: Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            '\$' + value.cartItems[index][1],
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index),
                          ),
                        ),
                      ),
                    );
                  }),
            )),

            // total amount + pay now
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(color: Colors.green[200]),
                        ),

                        const SizedBox(height: 8),
                        // total price

                        Text(
                          '\$${value.calculateTotal()}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    // pay now button
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade200),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Row(
                        children: [
                          Text(
                            'Pay Now',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
