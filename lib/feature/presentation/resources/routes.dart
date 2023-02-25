import 'package:flutter/material.dart';
import 'package:task/feature/presentation/onboarding/onboarding.dart';
import 'package:task/feature/presentation/resources/strings_manager.dart';
import 'package:task/feature/presentation/splash/splashscreen.dart';

class Routes
{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";

}
class RouteGenerator
{
  static Route<dynamic> getRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=>const OnBoardingScreen());
      default :
        return unDefiendRoute();
    }

  }
  static Route unDefiendRoute()
  {
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(
        title: const Text(AppString.notRouteFound),
      ),
      body:  const Center(child: Text(AppString.notRouteFound)),
    ));
  }
}