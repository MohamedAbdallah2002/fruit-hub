import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routes/route_name.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

class RouteHandler {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
    return null;
  }
}