import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/cart_model.dart';
import '../cart_page.dart';
import 'components/grocery_item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black),
          child: IconButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CartPage();
            })),
            icon: const Icon(Icons.shopping_bag),
            color: Colors.white,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Good Morning",
                style: TextStyle(),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 4,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: const EdgeInsets.all(12.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      itemImg: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemsToCart(index);
                        print('have added one to the cart');
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
