import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/book_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<Book, int> _books = {
    Book.fromJson(Constants.bookJson[0]): 1,
    Book.fromJson(Constants.bookJson[1]): 1,
    Book.fromJson(Constants.bookJson[2]): 1,
    Book.fromJson(Constants.bookJson[3]): 1,
    Book.fromJson(Constants.bookJson[4]): 1,
    Book.fromJson(Constants.bookJson[5]): 1,
  };
  List<Book> get books => _books.keys.toList();
  Map<Book, int> get booksWithQuantity => _books;
  int quantity(Book book) => _books[book] ?? 0;
  void addBook(Book book) {
    if (_books.containsKey(book)) {
      _books[book] = _books[book]! + 1;
    } else {
      _books[book] = 1;
    }
    notifyListeners();
  }

  void removeBook(Book book) {
    if (_books.containsKey(book)) {
      if (_books[book] == 1) {
        _books.remove(book);
      } else {
        _books[book] = _books[book]! - 1;
      }
    }
    notifyListeners();
  }

  double get subTotal {
    double subTotal = 0;
    _books.forEach((book, quantity) {
      subTotal += book.priceInDollar * quantity;
    });
    return subTotal;
  }

  void clearCart() {
    _books.clear();
    notifyListeners();
  }
}
