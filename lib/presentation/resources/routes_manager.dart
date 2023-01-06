import 'package:flutter/material.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/presentation/about/about.dart';
import 'package:pips_flutter/presentation/forgot_password/forgot_password.dart';
import 'package:pips_flutter/presentation/login/login.dart';
import 'package:pips_flutter/presentation/main/main.dart';
import 'package:pips_flutter/presentation/main/notifications/notifications.dart';
import 'package:pips_flutter/presentation/main/profile/profile.dart';
import 'package:pips_flutter/presentation/main/settings/settings.dart';
import 'package:pips_flutter/presentation/onboarding/onboarding.dart';
import 'package:pips_flutter/presentation/register/register.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/security/security.dart';
import 'package:pips_flutter/presentation/splash/splash.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String notificationsRoute = "/notifications";
  static const String storeDetailsRoute = "/storeDetails";
  static const String projectRoute = "/project";
  static const String profileRoute = "/profile";
  static const String settingsRoute = "/settings";
  static const String securityRoute = "/security";
  static const String aboutRoute = "/about";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        // initialize to make instance available
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutView());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.mainRoute:
        initDashboardModule();
        initNotificationsModule();
        initProjectsModule();
        initSearchModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.notificationsRoute:
        initNotificationsModule();
        return MaterialPageRoute(builder: (_) => const NotificationsPage());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.securityRoute:
        return MaterialPageRoute(builder: (_) => const SecurityPage());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
