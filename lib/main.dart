import 'package:flutter/material.dart';
import './screens/homepage_screen.dart';
import './screens/navigator_screen.dart';

import './constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          titleMedium:
              const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          bodySmall: TextStyle(fontSize: 12, color: txtColor),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: txtColor,
          ),
        ),
      ),
      home: NavigatorScreen(),
    );
  }
}
