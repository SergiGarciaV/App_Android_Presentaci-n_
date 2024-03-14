// En main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cv_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/hobbies_screen.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/cv': (context) => CvScreen(),
        '/portfolio': (context) => PortfolioScreen(),
        '/hobbies': (context) => HobbiesScreen(),
      },
    );
  }
}