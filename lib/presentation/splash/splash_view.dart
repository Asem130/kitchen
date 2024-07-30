import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kitchen/presentation/resources/assets_manger.dart';
import 'package:kitchen/presentation/resources/color_manger.dart';
import 'package:kitchen/presentation/resources/routes_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primary,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }
}
