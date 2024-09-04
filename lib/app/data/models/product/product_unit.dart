import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_unit.freezed.dart';
part 'product_unit.g.dart';

@freezed
class ProductUnit with _$ProductUnit {
  const factory ProductUnit({
    @JsonKey(name: "_id") required String id,
    required String unit,
  }) = _ProductUnit;

  factory ProductUnit.fromJson(Map<String, dynamic> json) =>
      _$ProductUnitFromJson(json);
}
