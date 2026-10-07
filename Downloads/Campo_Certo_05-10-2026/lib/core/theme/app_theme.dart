import 'package:flutter/material.dart';

import 'app_radius.dart';

class AppTheme {
  static const Color verdeEscuro = Color(0xFF0F5A3C);
  static const Color verdeClaro = Color(0xFF72BE44);
  static const Color amarelo = Color(0xFFF4B223);
  static const Color fundo = Color(0xFFF7F8F5);

  static ThemeData get tema {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: verdeEscuro,
      primary: verdeEscuro,
      secondary: verdeClaro,
      surface: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: fundo,
      appBarTheme: const AppBarTheme(
        backgroundColor: verdeEscuro,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: verdeClaro.withOpacity(0.25),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: verdeEscuro,
      ),
    );
  }
}
