import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF6A5ACD),
          secondary: Color(0xFF7B68EE),
          surface: Colors.white10,
          background: Color(0xFF1E1E1E),
          error: Colors.red.shade400,
        ),

        
        scaffoldBackgroundColor: Color(0xFF1E1E1E),

        
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.1,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.white70,
            letterSpacing: 0.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.white70,
            letterSpacing: 0.5,
          ),
        ),

        
        cardTheme: CardTheme(
          color: Colors.white10,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.white12),
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),

        
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white10,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade400),
          ),
          labelStyle: TextStyle(color: Colors.white70),
          hintStyle: TextStyle(color: Colors.white38),
        ),

        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF6A5ACD),
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),

        
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF6A5ACD),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF2E2E2E)),
            elevation: MaterialStateProperty.all(8),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),

        
        sliderTheme: SliderThemeData(
          activeTrackColor: Color(0xFF6A5ACD),
          inactiveTrackColor: Colors.white24,
          thumbColor: Colors.white,
          overlayColor: Color(0xFF6A5ACD).withOpacity(0.2),
          trackHeight: 4,
        ),

    
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 24,
        ),
      ),
      home: WelcomePage(),
    );
  }
}

