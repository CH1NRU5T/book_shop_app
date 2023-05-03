// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      title: json['title'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      priceInDollar: (json['priceInDollar'] as num).toDouble(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      availableFormat: (json['availableFormat'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'coverImageUrl': instance.coverImageUrl,
      'priceInDollar': instance.priceInDollar,
      'categories': instance.categories,
      'availableFormat': instance.availableFormat,
    };
