import 'package:flutter/material.dart';
import 'package:kitchen/app/di.dart';
import 'package:kitchen/presentation/forgot_password/forgot_password.dart';
import 'package:kitchen/presentation/login/view/login_view.dart';
import 'package:kitchen/presentation/main/main_view.dart';
import 'package:kitchen/presentation/onboarding/view/onboarding_view.dart';
import 'package:kitchen/presentation/register/register_view.dart';
import 'package:kitchen/presentation/splash/splash_view.dart';
import 'package:kitchen/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
         initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('AppStrings.noRouteFound.tr()'),
              ),
              body: const Center(child: Text('AppStrings.noRouteFound.tr()')),
            ));
  }
}
