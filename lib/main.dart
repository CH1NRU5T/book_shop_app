import 'package:flutter/material.dart';

import './features/home/screens/home_screen.dart';
import './router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Shop App',
      theme: ThemeData.light(),
      home: const HomeScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
