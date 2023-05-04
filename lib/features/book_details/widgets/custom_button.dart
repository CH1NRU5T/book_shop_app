import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        label: Text(
          'Add to Bag',
          style: GoogleFonts.workSans(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          foregroundColor: Constants.pinkColor,
          backgroundColor: Constants.pinkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
