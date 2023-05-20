import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Color temp = const Color.fromARGB(255, 59, 59, 61);

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

final primaryColor = MaterialColor(0xFF5858FD, color);
const primarySwatch = Colors.blue;
const secondaryColor = Colors.white;
const backgroundColor = Color.fromARGB(255, 23, 23, 29);
const surface = Color.fromARGB(255, 34, 34, 43);
final cards = const Color.fromARGB(255, 67, 67, 80).withOpacity(.2);
double gDiagnol = 1500;
//ptSans
ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        error: const Color.fromARGB(255, 157, 40, 40),
        onError: const Color.fromARGB(255, 170, 78, 78),
        surface: surface,
        onBackground: secondaryColor,
        background: backgroundColor,
        secondary: primarySwatch,
        onSecondary: secondaryColor,
        brightness: Brightness.dark,
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
        color: secondaryColor,
        fontSize: max(13, min(16, 14 * gDiagnol * .001)),
        fontWeight: FontWeight.bold,
      )),
      bodySmall: GoogleFonts.varelaRound(
          textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: max(13, min(16, 14 * gDiagnol * .001)),
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
              fontWeight: FontWeight.w800)),
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
    canvasColor: surface,
    brightness: Brightness.dark,
    dialogTheme: DialogTheme(
        contentTextStyle: GoogleFonts.varelaRound(
            textStyle: TextStyle(
      color: secondaryColor,
      fontWeight: FontWeight.bold,
      fontSize: max(13, min(16, 14 * gDiagnol * .001)),
    ))),
    primarySwatch: primarySwatch,
    primaryColor: primaryColor,
    dialogBackgroundColor: backgroundColor,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: primarySwatch,
        selectionColor: primarySwatch.withOpacity(0.5),
        selectionHandleColor: primarySwatch.withOpacity(0.5)),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(primarySwatch))),
    appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        titleTextStyle: GoogleFonts.varelaRound(
            textStyle: TextStyle(
          color: secondaryColor,
          fontSize: max(17, min(20, 18 * gDiagnol * .001)),
          fontWeight: FontWeight.bold,
        )),
        iconTheme: const IconThemeData(color: secondaryColor),
        systemOverlayStyle: SystemUiOverlayStyle.light),
    iconTheme: IconThemeData(color: secondaryColor.withOpacity(0.9)));
