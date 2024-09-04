// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopCategoryImpl _$$ShopCategoryImplFromJson(Map<String, dynamic> json) =>
    _$ShopCategoryImpl(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: (parseImage(json, 'image') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$ShopCategoryImplToJson(_$ShopCategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
