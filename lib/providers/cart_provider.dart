import 'package:flutter/material.dart';

import '../models/book_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<Book, int> _books = {};
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
    return double.parse(subTotal.toStringAsFixed(4));
  }

  void clearBook(Book book) {
    _books.remove(book);
    notifyListeners();
  }

  void clearCart() {
    _books.clear();
    notifyListeners();
  }
}
