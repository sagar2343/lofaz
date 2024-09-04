// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'vendor.freezed.dart';
part 'vendor.g.dart';

@freezed
class Vendor with _$Vendor {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Vendor({
    @JsonKey(name: "_id") required String id,
    @JsonKey(defaultValue: '') required String firstName,
    @JsonKey(defaultValue: '') required String surnameName,
    required String username,
    required String phone,
    @JsonKey(
      defaultValue: [],
    )
    required List<String> shopCategoryId,
    required String businessName,
    String? photo,
    @JsonKey(
      defaultValue: [],
      readValue: parseImage,
    )
    required List<String> logo,
    @Default(0) int views,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}

parseImage(Map json, String key) {
  if (json[key] is List) {
    return (json[key] as List).map((e) => e['location'] as String).toList();
  }
  return [];
}
