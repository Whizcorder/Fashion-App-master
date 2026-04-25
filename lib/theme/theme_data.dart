import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  final BuildContext context;
  late final TextTheme textTheme;
  late final ThemeData _primaryTheme;

  CustomTheme(this.context) {
    textTheme = Theme.of(context).textTheme;

    _primaryTheme = ThemeData(
      primaryColor: Colors.black,
      textTheme: GoogleFonts.adventProTextTheme(textTheme).copyWith(
        bodyMedium: const TextStyle(color: Colors.white),
        bodyLarge: const TextStyle(color: Colors.white),
        titleLarge: const TextStyle(color: Colors.white),
      ),
    );
  }

  ThemeData get primaryTheme => _primaryTheme;
}