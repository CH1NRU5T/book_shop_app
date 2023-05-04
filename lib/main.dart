import 'package:book_shop_app/features/book_details/screens/book_detail_screen.dart';
import 'package:book_shop_app/models/book_model.dart';
import 'package:book_shop_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './router.dart';
import 'constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Shop App',
      theme: ThemeData.light(),
      home: BookDetailScreen(
        book: Book.fromJson(Constants.bookJson[48]),
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
