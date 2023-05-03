import 'package:book_shop_app/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.imageUrl, required this.bookTitle});
  final String imageUrl;
  final String bookTitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: imageUrl),
          Text(
            bookTitle,
            style: TextStyle(color: Constants.pinkColor),
          ),
          const Text('Mark Siegel'),
        ],
      ),
    );
  }
}
