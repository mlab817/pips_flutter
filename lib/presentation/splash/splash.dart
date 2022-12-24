import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pips_flutter/app/app_prefs.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/routes_manager.dart';

import '../../app/dependency_injection.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  Timer? _timer;

  void _startDelay() {
    _timer = Timer(
        const Duration(
          seconds: 2,
        ),
        _goNext);
  }

  // redirect user based on status isUserLoggedIn
  void _goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) =>
    {
      if (isUserLoggedIn)
        {Navigator.pushReplacementNamed(context, Routes.mainRoute)}
      else
        {
          _appPreferences
              .isOnBoardingScreenViewed()
              .then((isOnBoardingScreenViewed) =>
          {
            if (isOnBoardingScreenViewed)
              {
                Navigator.pushReplacementNamed(
                    context, Routes.loginRoute)
              }
            else
              {
                Navigator.pushReplacementNamed(
                    context, Routes.onBoardingRoute)
              }
          })
        }
    });
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
      backgroundColor: ColorManager.white,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }
}
