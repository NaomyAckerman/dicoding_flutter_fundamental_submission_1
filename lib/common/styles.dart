import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF00512D);
const Color secondaryColor = Color(0xFFCF9F69);

ColorScheme cColorScheme(BuildContext context) =>
    Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: secondaryColor,
        );

const AppBarTheme cAppBarTheme = AppBarTheme(
  elevation: 0,
  color: Colors.white,
);

ElevatedButtonThemeData cElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: secondaryColor,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ),
  ),
);
TextButtonThemeData cTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: secondaryColor,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ),
  ),
);

final TextTheme cTextTheme = TextTheme(
  displayLarge: GoogleFonts.inter(
      fontSize: 94, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.inter(
      fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.inter(
      fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.openSans(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.openSans(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  bodySmall: GoogleFonts.openSans(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  labelLarge: GoogleFonts.openSans(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.openSans(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
