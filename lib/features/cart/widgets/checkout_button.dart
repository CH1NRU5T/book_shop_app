import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, required this.disabled});
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: disabled ? Constants.black20 : Constants.pinkColor,
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Proceed to Checkout',
          style: GoogleFonts.workSans(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
