import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project2/presentation/helper/app_colors.dart';
import 'package:project2/presentation/helper/app_routes.dart';
import 'package:project2/presentation/helper/assets_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer ;
  _startDelay(){
    _timer = Timer(const Duration(milliseconds: 1500),_nextView);
  }
  _nextView(){
    Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
  }
  @override
  void initState() {

    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(AssetsString.logo),
      ),
    );
  }
}
