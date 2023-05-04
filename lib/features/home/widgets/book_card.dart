import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.imageUrl, required this.bookTitle});
  final String imageUrl;
  final String bookTitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CachedNetworkImage(imageUrl: imageUrl, width: 200, height: 100),
          Text(
            bookTitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.workSans(
                color: Constants.pinkColor, fontWeight: FontWeight.bold),
          ),
          Text('Mark Siegel',
              style: GoogleFonts.workSans(color: Constants.black63)),
        ],
      ),
    );
  }
}
