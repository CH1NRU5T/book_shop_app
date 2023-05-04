import 'package:book_shop_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../models/book_model.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.book});
  final Book book;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constants.pinkColor,
      ),
      child: cartProvider.books.contains(widget.book)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      cartProvider.removeBook(widget.book);
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                Text(cartProvider.quantity(widget.book).toString(),
                    style: GoogleFonts.workSans(
                        color: Colors.white, fontSize: 20)),
                IconButton(
                    onPressed: () {
                      cartProvider.addBook(widget.book);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ],
            )
          : Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {
                  cartProvider.addBook(widget.book);
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'Add to Bag',
                  style: GoogleFonts.workSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Constants.pinkColor,
                  backgroundColor: Constants.pinkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
    );
  }
}
