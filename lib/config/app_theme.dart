import 'package:flutter/material.dart';

class AppTheme {
  static const textTheme = TextTheme(
    // Titles
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    // Buttons
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    // Body
    bodyLarge: TextStyle(
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
    ),
  );

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xff007aff),
      secondary: Color(0xff34c759),
      tertiary: Color(0xffff3b30),

      /// used for menus
      surfaceVariant: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xffF7F6F2),
    textTheme: textTheme,
  );

  static final darkTheme = ThemeData(
    /// see color docs in ligh theme
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff007aff),
      onPrimary: Colors.white,
      secondary: Color(0xff34c759),
      tertiary: Color(0xffff3b30),
      background: Color(0xff252528),
      surface: Color(0xff252528),
      surfaceVariant: Color(0xff3c3c3f),
    ),
    scaffoldBackgroundColor: const Color(0xff161618),
    textTheme: textTheme,
  );
}
