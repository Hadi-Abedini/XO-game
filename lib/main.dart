import 'package:flutter/material.dart';
import 'package:xo/View/spalsh_screen.dart';
import 'package:xo/my_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Vazir",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Vazir',
            fontWeight: FontWeight.w700,
            fontSize: 50,
            color: SolidColors.primaryColor,
          ),
          headline2: TextStyle(
            fontFamily: 'Vazir',
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: SolidColors.secondaryColor,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
