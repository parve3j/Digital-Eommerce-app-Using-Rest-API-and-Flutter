import 'package:flutter/material.dart';
class AppThemeData{
  static ThemeData lightThemeData= ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.teal
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 14,
          letterSpacing: 0.3
        )
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
        )
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
        )
      )
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black54
      ),
      elevation: 5,
      color: Colors.white
    )
  );
}