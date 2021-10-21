import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileGiniLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "GINI",
      style: GoogleFonts.fredokaOne().copyWith(
        // TODO: Change to PROXIMA SOFT
          fontSize: 40.0,
          fontWeight: FontWeight.w800,
          color: Color.fromRGBO(226, 226, 226, 1)),
    );
  }
}
