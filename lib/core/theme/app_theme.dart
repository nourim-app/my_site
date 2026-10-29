import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const blue = Color(0xFF1463FF);
const navy = Color(0xFF10254B);
const pale = Color(0xFFEAF3FF);
ThemeData appTheme() => ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.manrope().fontFamily,
  colorScheme: ColorScheme.fromSeed(
    seedColor: blue,
    primary: blue,
    onSurface: navy,
  ),
  scaffoldBackgroundColor: const Color(0xFFF6F8FC),
  textTheme: ThemeData().textTheme.apply(
    fontFamily: GoogleFonts.manrope().fontFamily,
    bodyColor: navy,
    displayColor: navy,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF6F8FC),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
  ),
);
