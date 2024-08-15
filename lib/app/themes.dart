import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

const Color primary = AppConfig.primary;
const Color surface = AppConfig.surface;
const Color secondary = AppConfig.secondary;
const Color linkColor = AppConfig.linkColor;
const Color error = AppConfig.error;
const Color tertiary = AppConfig.tertiary;
const double borderRadius = AppConfig.globalRadius;
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
  tertiary: tertiary, // Additional accent color
  onTertiary: primary, // Text and icon color for tertiary
  // tertiaryContainer: tertiaryContainer, // Background color for tertiary
  // onTertiaryContainer: onTertiaryContainer, // Text and icon color for tertiaryContainer
);

final ThemeData appTheme = ThemeData(
  colorScheme: KColorScheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: surface,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: primary,
    ),
  ),
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
