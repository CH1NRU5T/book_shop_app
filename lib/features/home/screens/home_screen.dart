import 'package:book_shop_app/features/cart/screens/cart_screen.dart';
import 'package:book_shop_app/features/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../features/home/services/home_services.dart';
import '../../../features/home/widgets/book_card.dart';
import '../../../models/book_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToCartScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CartScreen.routeName);
  }

  final HomeServices _homeServices = HomeServices();
  List<Book>? books;
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    books = _homeServices.getAllBooks();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: SearchField(controller: _searchController)),
                  IconButton(
                    onPressed: () => navigateToCartScreen(context),
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                      color: Constants.pinkColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: books!.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return BookCard(
                        book: books![index],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
