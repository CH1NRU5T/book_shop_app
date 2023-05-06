import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Book {
  @HiveField(0)
  String title;
  @HiveField(1)
  String cover_image_url;
  @HiveField(2)
  double price_in_dollar;
  @HiveField(3)
  List<String>? categories;
  @HiveField(4)
  List<String>? available_format;

  Book({
    required this.title,
    required this.cover_image_url,
    required this.price_in_dollar,
    this.categories,
    this.available_format,
  });

  @override
  String toString() => title;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
