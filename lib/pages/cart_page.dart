import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'My Cart',
                    style: GoogleFonts.notoSerif(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index][2],
                              height: 36,
                            ),
                            title: Text(value.cartItems[index][0]),
                            subtitle: Text('\$$value.cartItems[index][1]'),
                            trailing: IconButton(
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemfromCart(index);
                                },
                                icon: const Icon(Icons.cancel)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(36),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Price ',
                              style: TextStyle(
                                color: Colors.lightGreen,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '\$' + value.CalculateTotal(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green.shade100),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Text(
                                'Pay Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
