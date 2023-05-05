import 'package:book_shop_app/constants/constants.dart';
import 'package:book_shop_app/features/book_details/widgets/custom_button.dart';
import 'package:book_shop_app/features/cart/screens/cart_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/book_model.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.book});
  static const routeName = '/book-detail-screen';
  final Book book;
  void navigateToCartScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CartScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => navigateToCartScreen(context),
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: Constants.pinkColor,
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Constants.pinkColor,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: book.coverImageUrl,
                    fit: BoxFit.scaleDown,
                    width: 250,
                    height: 200,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      book.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.workSans(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Mark Siegel',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.workSans(
                          fontSize: 20, color: Constants.black63),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'In the epic conclusion to the 5 Worlds series, the final battle looms In the epic conclusion to the 5 Worlds series, the final battle looms...',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.workSans(
                          fontSize: 20, color: Constants.black63),
                    ),
                  ],
                ),
              ),
              Text(
                '\$${book.priceInDollar}',
                textAlign: TextAlign.start,
                style: GoogleFonts.workSans(
                    fontSize: 50,
                    color: Constants.pinkColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CustomButton(
                book: book,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
