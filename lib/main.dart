import 'package:flutter/material.dart';
import 'pages/splash/splash_app.dart';
import 'theme/theme_app.dart';
import 'theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dmentz Inc',
      theme: CustomTheme.purpleTheme,
      darkTheme: AppTheme.lightTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
