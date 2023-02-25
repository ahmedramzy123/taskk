import 'package:flutter/material.dart';
import 'package:task/feature/presentation/onboarding/view/onboardingviewbody.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
