// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_category.freezed.dart';
part 'shop_category.g.dart';

@freezed
class ShopCategory with _$ShopCategory {
  const factory ShopCategory({
    @JsonKey(name: "_id", defaultValue: '') required String id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(
      defaultValue: [],
      readValue: parseImage,
    )
    required List<String> image,
  }) = _ShopCategory;

  factory ShopCategory.fromJson(Map<String, dynamic> json) =>
      _$ShopCategoryFromJson(json);
}

parseImage(Map json, String key) {
  if (json[key] is List) {
    return (json[key] as List).map((e) => e['location'] as String).toList();
  }
  return [];
}
