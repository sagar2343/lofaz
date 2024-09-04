// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lofaz/app/data/models/product/product.dart';
part 'catalog.freezed.dart';
part 'catalog.g.dart';

@freezed
class CatalogResponse with _$CatalogResponse {
  const factory CatalogResponse({
    @JsonKey(defaultValue: []) required List<Catalog> data,
    required int total,
  }) = _CatalogResponse;

  factory CatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogResponseFromJson(json);
}

@freezed
class Catalog with _$Catalog {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Catalog({
    @JsonKey(name: "_id") required String id,
    required String title,
    required String url,
    // @JsonKey(defaultValue: '', fromJson: maptoUserId) required String userId,
    @Default(false) bool status,
    // @Default(0) int view,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
    @Default([]) List<PhotoModel> photos,
  }) = _Catalog;

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);
}

maptoUserId(dynamic data) {
  if (data.runtimeType == String) {
    return data;
  }
  if (data.runtimeType == Map) {
    return data['_id'] as String;
  }

  return '';
}

parsePhotos(Map data, String key) {
  if (data[key] == null) {
    return [];
  }
}
