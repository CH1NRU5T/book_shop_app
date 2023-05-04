import 'package:book_shop_app/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../providers/cart_provider.dart';

class CartBookCard extends StatefulWidget {
  const CartBookCard({super.key, required this.index});
  final int index;
  @override
  State<CartBookCard> createState() => _CartBookCardState();
}

class _CartBookCardState extends State<CartBookCard> {
  void remove(Book book) {
    Provider.of<CartProvider>(context, listen: false).removeBook(book);
  }

  void clear(Book book) {
    Provider.of<CartProvider>(context, listen: false).clearBook(book);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: Provider.of<CartProvider>(context, listen: false)
                  .books[widget.index]
                  .coverImageUrl,
              fit: BoxFit.fill,
              width: 10,
              height: 190,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              Text(
                Provider.of<CartProvider>(context, listen: false)
                    .books[widget.index]
                    .title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.workSans(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Text(
                '\$ ${Provider.of<CartProvider>(context, listen: false).books[widget.index].priceInDollar}',
                textAlign: TextAlign.center,
                style: GoogleFonts.workSans(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      remove(Provider.of<CartProvider>(context, listen: false)
                          .books[widget.index]);
                    },
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Constants.pinkColor,
                    ),
                  ),
                  Text(
                    '${Provider.of<CartProvider>(context).quantity(Provider.of<CartProvider>(context, listen: false).books[widget.index])}',
                    style: GoogleFonts.workSans(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addBook(
                          Provider.of<CartProvider>(context, listen: false)
                              .books[widget.index]);
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Constants.pinkColor,
                    ),
                  ),
                  const SizedBox(width: 1),
                  IconButton(
                      onPressed: () {
                        clear(Provider.of<CartProvider>(context, listen: false)
                            .books[widget.index]);
                      },
                      icon: Icon(
                        Icons.clear_rounded,
                        color: Constants.pinkColor,
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
