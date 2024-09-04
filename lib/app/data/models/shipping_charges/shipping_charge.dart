// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'shipping_charge.freezed.dart';
part 'shipping_charge.g.dart';

@freezed
class ShippingCharge with _$ShippingCharge {
  const factory ShippingCharge({
    @JsonKey(name: 'free_shipping_after') double? freeShippingAfter,
    @JsonKey(name: 'shipping_cost') double? shippingCost,
  }) = _ShippingCharge;

  factory ShippingCharge.fromJson(Map<String, dynamic> json) =>
      _$ShippingChargeFromJson(json);
}
