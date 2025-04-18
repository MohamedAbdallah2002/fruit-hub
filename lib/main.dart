import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/config/shared_preferences_singlton.dart';
import 'package:fruit_hub/core/routes/route_handler.dart';
import 'package:fruit_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar', ''),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: RouteHandler.generateRoute,
    );
  }
}
