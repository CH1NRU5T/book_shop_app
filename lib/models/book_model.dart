import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class Book {
  String title;
  String coverImageUrl;
  double priceInDollar;
  List<String>? categories;
  List<String>? availableFormat;

  Book({
    required this.title,
    required this.coverImageUrl,
    required this.priceInDollar,
    this.categories,
    this.availableFormat,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
