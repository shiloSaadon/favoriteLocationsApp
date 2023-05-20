import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Color temp = const Color(0xffFF87B2);

Map<int, Color> color = {
  50: temp,
  100: temp,
  200: temp,
  300: temp,
  400: temp,
  500: temp,
  600: temp,
  700: temp,
  800: temp,
  900: temp,
};

final primaryColor = MaterialColor(0xFFFF87B2, color);
const secondaryColor = Color(0xff40393A);
const colorOnSurface = Colors.pink;
const backgroundColor =
    Color(0xffF6F6F6); // Color.fromARGB(255, 241, 210, 199);
const surface = Color(0xffFFFFFF);
const primarySwatch = Color(0xFFFF87B2);
final cards = const Color(0xffFFF4F6).withOpacity(0.8);
double gDiagnol = 1500;
ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        error: const Color.fromARGB(255, 157, 40, 40),
        onError: const Color.fromARGB(255, 136, 34, 34),
        surface: surface,
        onBackground: secondaryColor,
        background: backgroundColor,
        secondary: primarySwatch,
        onSecondary: colorOnSurface,
        brightness: Brightness.light,
        onSurface: secondaryColor,
        primary: primaryColor,
        onPrimary: secondaryColor,
        tertiary: cards),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: backgroundColor),
    fontFamily: "Inter",
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.varelaRound(
          textStyle: TextStyle(
        color: colorOnSurface,
        fontSize: max(13, min(16, 14 * gDiagnol * .001)),
        fontWeight: FontWeight.bold,
      )),
      bodySmall: GoogleFonts.varelaRound(
          textStyle: TextStyle(
        color: colorOnSurface,
        fontSize: max(11, min(14, 12 * gDiagnol * .001)),
        fontWeight: FontWeight.bold,
      )),
      bodyMedium: GoogleFonts.varelaRound(
          textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: max(13, min(16, 14 * gDiagnol * .001)),
      )),
      titleMedium: GoogleFonts.varelaRound(
          textStyle: TextStyle(
              fontSize: max(17, min(20, 18 * gDiagnol * .001)),
              fontWeight: FontWeight.w800)),
      titleSmall: GoogleFonts.varelaRound(
          textStyle: TextStyle(
              fontSize: max(17, min(20, 18 * gDiagnol * .001)),
              fontWeight: FontWeight.w800)),
      titleLarge: GoogleFonts.varelaRound(
          textStyle: TextStyle(
              fontSize: max(17, min(20, 18 * gDiagnol * .001)),
              fontWeight: FontWeight.w800)), //headline for all dialogs titles
      headlineSmall: GoogleFonts.varelaRound(
          textStyle: TextStyle(
              color: secondaryColor,
              fontSize: max(23, min(26, 24 * gDiagnol * .001)),
              fontWeight: FontWeight.bold)),
      headlineMedium: GoogleFonts.varelaRound(
          textStyle: TextStyle(
              color: secondaryColor,
              fontSize: max(24, min(27, 25 * gDiagnol * .001)),
              fontWeight: FontWeight.w400)),
      displaySmall: GoogleFonts.varelaRound(
          textStyle: const TextStyle(
              color: secondaryColor, fontWeight: FontWeight.bold)),
    ),
    brightness: Brightness.light,
    primarySwatch: primaryColor,
    primaryColor: primaryColor,
    dialogTheme: DialogTheme(
        contentTextStyle: GoogleFonts.varelaRound(
            textStyle: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: max(13, min(16, 14 * gDiagnol * .001))))),
    dialogBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        titleTextStyle: GoogleFonts.varelaRound(
            textStyle: TextStyle(
          color: secondaryColor,
          fontSize: max(17, min(20, 18 * gDiagnol * .001)),
          fontWeight: FontWeight.bold,
        )),
        iconTheme: const IconThemeData(color: secondaryColor),
        systemOverlayStyle: SystemUiOverlayStyle.dark),
    iconTheme: const IconThemeData(color: secondaryColor));
