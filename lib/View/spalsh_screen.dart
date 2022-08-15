import 'package:flutter/material.dart';
import 'package:xo/View/home_screen.dart';
import 'package:xo/gen/assets.gen.dart';
import 'package:xo/my_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.primaryColor,
        body: Center(
          child: Image(
            image: AssetImage(Assets.images.splashLoading.path),
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
