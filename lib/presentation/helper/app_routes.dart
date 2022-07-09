import 'package:flutter/material.dart';
import 'package:project2/presentation/helper/app_strings.dart';
import 'package:project2/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:project2/presentation/screens/login/login_screen.dart';
import 'package:project2/presentation/screens/main/main_screen.dart';
import 'package:project2/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:project2/presentation/screens/register/register_screen.dart';
import 'package:project2/presentation/screens/store_detaols/store_details_screen.dart';

import '../screens/plash/splash_screen.dart';

class AppRoutes{
  static const String splashScreen = '/';
  static const String onBoardingScreen = '/onBoarding';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgetPasswordScreen = '/forgetPassword';
  static const String mainScreen = '/main';
  static const String storeDetailScreen = '/storeDetails';



}
class AppRouter {


  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) =>const SplashScreen());
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) =>const OnBoardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) =>const LoginScreen());
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) =>const RegisterScreen());
      case AppRoutes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) =>const ForgetPasswordScreen());
      case AppRoutes.mainScreen:
        return MaterialPageRoute(builder: (_) =>const MainScreen());
      case AppRoutes.storeDetailScreen:
        return MaterialPageRoute(builder: (_) =>const StoreDetailsScreen());
      default:null;
    }
    return null;
  }
  static Route<dynamic> defaultRoute(){
    return MaterialPageRoute(builder: (_)=>const Scaffold(
      body: Center(
        child: Text(AppStrings.noRoute),
      ),

    ));
  }
}