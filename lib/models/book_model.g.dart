// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      title: json['title'] as String,
      coverImageUrl: json['cover_image_url'] as String,
      priceInDollar: (json['price_in_dollar'] as num).toDouble(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableFormat: (json['available_format'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'coverImageUrl': instance.coverImageUrl,
      'priceInDollar': instance.priceInDollar,
      'categories': instance.categories,
      'availableFormat': instance.availableFormat,
    };
