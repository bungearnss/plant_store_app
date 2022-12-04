import 'package:flutter/material.dart';
import './screens/homepage_screen.dart';

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
          bodySmall: TextStyle(fontSize: 13, color: Colors.grey.shade400),
        ),
      ),
      home: HomepageScreen(),
    );
  }
}
