import 'package:flutter/material.dart';

import './features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/home':
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('No route!')),
        ),
      );
  }
}
