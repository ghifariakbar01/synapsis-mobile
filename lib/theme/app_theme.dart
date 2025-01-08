import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1073FC);

  static const TextTheme textTheme = TextTheme(
    titleSmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 19,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
    ),
    textTheme: textTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
    ),
    textTheme: textTheme,
  );
}
