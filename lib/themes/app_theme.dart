import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryDark = Color(0xFF4D4C6B);
  static const Color backgroundDark = Color(0xFF19162B);
  static const Color textDark = Color(0xFFFDFEFF);

  static const Color primaryLight = Color(0xFFFFE9C3);
  static const Color backgroundLight = Color(0xFFFDFEFF);
  static const Color textLight = Color(0xFF4D4C6B);

  static TextStyle get footerTextDark => const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: textDark,
  );

  static TextStyle get footerTextLight => const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: textLight,
  );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDark,
      titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: textDark,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: backgroundDark,
      modalBackgroundColor: backgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
    ),
  );

  static ThemeData get lightTheme => ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLight,
      titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: textLight,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: backgroundLight,
      modalBackgroundColor: backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
    ),
  );
}
