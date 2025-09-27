import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData purpleTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF7020FA), // púrpura
      brightness: Brightness.light,
    ).copyWith(
      primary: Color(0xFF7020FA), // Forzar púrpura intenso
      secondary: Color(0xFFE91E63), // rosa
    ),
    useMaterial3: true,
  );

  static final ThemeData purpleDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF512DA8), // púrpura oscuro
      brightness: Brightness.dark,
    ).copyWith(
      secondary: Color(0xFFF48FB1), // rosa claro
    ),
    useMaterial3: true,
  );
}
