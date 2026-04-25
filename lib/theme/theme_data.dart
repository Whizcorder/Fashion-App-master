import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  BuildContext context;
  TextTheme textTheme;
  ThemeData _primaryTheme;
  CustomTheme(BuildContext context) {
    this.context = context;
    textTheme = Theme.of(context).textTheme;
    _primaryTheme = ThemeData(
        primaryColor: Colors.black,
        textTheme: GoogleFonts.adventProTextTheme(textTheme).copyWith(
          bodyText2: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
        ));
  }

  ThemeData get primaryTheme => _primaryTheme;
}
