import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData TTCTheme = ThemeData(
  fontFamily: GoogleFonts.merriweather().fontFamily,
  primaryColor: Colors.amber,
  colorScheme:
      ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 239, 115, 62)),
  useMaterial3: true,
);
