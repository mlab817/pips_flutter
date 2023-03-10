import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/data/data_source/shared_prefs_data_source.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/app/routes.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SharedPrefsDataSource _appPreferences =
      instance<SharedPrefsDataSource>();

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
    _appPreferences.getIsUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {Navigator.pushReplacementNamed(context, Routes.mainRoute)}
          else
            {
              _appPreferences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
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
        child: SizedBox(
          width: AppSize.s200,
          height: AppSize.s200,
          child: Lottie.asset(JsonAssets.splash),
        ), // Image.asset(ImageAssets.splashLogo),
      ),
    );
  }
}
