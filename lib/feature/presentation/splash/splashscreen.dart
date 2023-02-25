import 'package:flutter/material.dart';
import 'package:task/feature/presentation/resources/color_manager.dart';
import 'package:task/feature/presentation/splash/view/splashscreenbody.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundSplash,
      body: const SplashScreenBody(),
    );
  }
}
