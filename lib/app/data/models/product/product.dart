// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lofaz/app/data/models/catalog/catalog.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductsResponse with _$ProductsResponse {
  const factory ProductsResponse({
    @JsonKey(defaultValue: []) required List<Product> data,
    required int total,
  }) = _ProductsResponse;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}

@freezed
class Product with _$Product {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Product({
    @JsonKey(name: "_id") required String id,
    required String title,
    required String url,
    required double salesPrice,
    required double mrp,
    required String desc,
    String? featuredImg,
    @Default([]) List<PhotoModel?> photo,
    String? trends,
    required double unitCount,
    required String unit,
    required String userId,
    required bool status,
    required int views,
    required Catalog category,
    int? stock,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
    bool? catStatus,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required String location,
    required String? key,
    dynamic eTag,
    required String? serverSideEncryption,
    @Default("") String bucket,
    @JsonKey(name: "_id") required String id,
  }) = _Photo;

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}

extension ProductX on Product {
  double get getPrice {
    return salesPrice != 0.0 ? salesPrice : mrp;
  }
}
