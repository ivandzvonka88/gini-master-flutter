import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColor: Color(0xFF7D6AF4),
      accentColor: Color(0xFF7D6AF4),
      scaffoldBackgroundColor: Colors.white,
      cursorColor: Color(0xFF7D6AF4),
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            fontFamily: GoogleFonts.archivo().fontFamily,
            color: Colors.black,
          ),
        ),
      ),
      fontFamily: GoogleFonts.archivo().fontFamily);
}
