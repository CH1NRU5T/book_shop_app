import 'package:book_shop_app/constants/constants.dart';
import 'package:book_shop_app/features/cart/widgets/checkout_button.dart';
import 'package:book_shop_app/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Book> books = [];
  @override
  void initState() {
    super.initState();
    books = Provider.of<CartProvider>(context, listen: false)
        .booksWithQuantity
        .keys
        .toList();
  }

  void remove(Book book) {
    Provider.of<CartProvider>(context, listen: false).removeBook(book);
    setState(() {
      books = Provider.of<CartProvider>(context, listen: false)
          .booksWithQuantity
          .keys
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,
              color: Constants.pinkColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Bag ',
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text:
                          '(${Provider.of<CartProvider>(context).books.length})',
                      style: GoogleFonts.workSans(color: Constants.black40)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            books.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text(
                        'Your Bag is Empty',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.workSans(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    books[index].coverImageUrl,
                                    fit: BoxFit.fill,
                                    width: 250,
                                    height: 200,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      books[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.workSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 10),
                                    Text(
                                      '\$ ${books[index].priceInDollar}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.workSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            remove(books[index]);
                                          },
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            color: Constants.pinkColor,
                                          ),
                                        ),
                                        Text(
                                          '${Provider.of<CartProvider>(context).quantity(books[index])}',
                                          style: GoogleFonts.workSans(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .addBook(books[index]);
                                          },
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                            color: Constants.pinkColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: books.length),
                  ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Subtotal: ',
                  style: GoogleFonts.workSans(
                      color: Constants.black63, fontSize: 30),
                ),
                Text(
                  '\$ ${Provider.of<CartProvider>(context).subTotal}',
                  style: GoogleFonts.workSans(
                      color: Constants.pinkColor, fontSize: 30),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CheckoutButton(disabled: books.length > 5 ? true : false),
          ],
        ),
      ),
    );
  }
}
