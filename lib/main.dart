import 'package:flutter/material.dart';
import 'pages/splash/splash_app.dart';
import 'theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // acceso global para cambiar el tema desde cualquier parte de la app
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _theme = CustomTheme.purpleTheme; // Tema inicial

  void changeTheme(ThemeData theme) {
    setState(() {
      _theme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dmentz Inc',
      theme: _theme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
