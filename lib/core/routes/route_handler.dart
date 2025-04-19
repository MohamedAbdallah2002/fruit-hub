import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routes/route_name.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

class RouteHandler {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case RouteName.logIn:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpView());
    }
    return null;
  }
}
