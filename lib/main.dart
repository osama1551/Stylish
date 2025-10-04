import 'package:flutter/material.dart';
import 'package:stylish/wedgits/welcome_screens/splash_screen.dart';
import 'package:stylish/wedgits/welcome_screens/onboarding_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Stylish',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1C1C), // Dark background
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8A2BE2), // Primary color is a bright purple
          secondary: Color(0xFF3A3A3A), // A dark gray for secondary elements
          onPrimary: Colors.white,
          onSurface: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white70),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
          ),

          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF8A2BE2)),
          ),
        ),
         // A deep, dark background color
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, // Make AppBar transparent
          elevation: 0, // Remove shadow
        ),
        textTheme: const TextTheme(
          // Set a default style for text
          bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
        ),
        // Custom button themes to match the design
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      home: const SplashScreenWithNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreenWithNavigation extends StatefulWidget {
  const SplashScreenWithNavigation({super.key});

  @override
  State<SplashScreenWithNavigation> createState() => _SplashScreenWithNavigationState();
}

class _SplashScreenWithNavigationState extends State<SplashScreenWithNavigation> {
  @override
  void initState() {
    super.initState();
    // Navigate to onboarding screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const StylishSplashScreen();
  }
}
