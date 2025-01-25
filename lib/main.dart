import 'package:app_dev_workshop/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculatorApp());

// Custom Theme and Material Design Concepts
class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Custom color scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF6A5ACD),
          primary: Color(0xFF6A5ACD),
          secondary: Color(0xFF7B68EE),
        ),
        // Typography
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
        // Custom app-wide styling
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF6A5ACD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}

