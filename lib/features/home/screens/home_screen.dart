import 'package:book_shop_app/features/home/services/home_services.dart';
import 'package:book_shop_app/features/home/widgets/book_card.dart';
import 'package:flutter/material.dart';

import '../../../models/book_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeServices _homeServices = HomeServices();
  List<Book>? books;

  @override
  void initState() {
    super.initState();
    books = _homeServices.getAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // row for search bar and cart button
          Row(),
          const SizedBox(height: 20),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return BookCard(
                imageUrl: books![index].coverImageUrl,
                bookTitle: books![index].title,
              );
            },
          )
        ],
      ),
    );
  }
}
