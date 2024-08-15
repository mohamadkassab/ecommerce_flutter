import 'package:flutter/material.dart';

const Color primary = Color.fromARGB(255, 0, 0, 0);
const Color surface = Color.fromARGB(255, 255, 255, 255);
const Color secondary = Color.fromARGB(255, 161, 161, 161);
const Color linkColor = Color.fromARGB(255, 51, 151, 238);
const Color error = Color.fromARGB(255, 229, 57, 53);
const Color success = Color.fromARGB(255, 76, 175, 80);
const double borderRadius = 8.0;
const double borderWidth = 1.0;
const double buttonFontSize = 16;
const double buttonPaddingHorizontal = 20;
const double buttonPaddingVertical = 16;
const double scaffoldPadding = 16;
const double elevation = 0;

const ColorScheme KColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary, // Main color for widgets
    onPrimary: surface, // Color used for text and icons on primary color
    primaryContainer: secondary, // Background color for containers
    onPrimaryContainer:
        primary, // Color used for text and icons on primaryContainer
    secondary: secondary, // Secondary color for widgets
    onSecondary: primary, // Color used for text and icons on secondary color
    secondaryContainer: surface, // Background color for secondary containers
    onSecondaryContainer:
        primary, // Color used for text and icons on secondaryContainer
    surface: surface, // Surface color for material widgets
    onSurface: primary, // Color used for text and icons on surface
    error: error, // Default error color
    onError: surface, // Color used for text and icons on error color
    tertiary: success,
    onTertiary: surface);

final ThemeData appTheme = ThemeData(
  colorScheme: KColorScheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: surface,
  // appBarTheme: const AppBarTheme(
  //   titleTextStyle: TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 20,
  //     color: primary,
  //   ),
  // ),
  // appBarTheme: AppBarTheme(
  //   backgroundColor: primary, // Set the AppBar color to black
  // ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: secondary),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        color: secondary,
        width: borderWidth,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        color: secondary,
        width: borderWidth,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        color: primary,
        width: borderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        color: error,
        width: borderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        color: error,
        width: borderWidth,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
          horizontal: buttonPaddingHorizontal, vertical: buttonPaddingVertical),
      textStyle: const TextStyle(
        fontSize: buttonFontSize,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: linkColor,
    ),
  ),
);
