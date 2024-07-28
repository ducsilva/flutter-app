import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.lightBlue,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
          bodyLarge: TextStyle(fontSize: 16.0, fontFamily: 'Arial'),
          labelLarge: TextStyle(color: Colors.white, fontFamily: 'Arial'),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
