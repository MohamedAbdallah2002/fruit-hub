import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routes/route_handler.dart';

void main() {
  runApp(const FruitHub());
}
class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteHandler.generateRoute,
      
    );
  }
}