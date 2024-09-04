// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_charge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShippingChargeImpl _$$ShippingChargeImplFromJson(Map<String, dynamic> json) =>
    _$ShippingChargeImpl(
      freeShippingAfter: (json['free_shipping_after'] as num?)?.toDouble(),
      shippingCost: (json['shipping_cost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ShippingChargeImplToJson(
        _$ShippingChargeImpl instance) =>
    <String, dynamic>{
      'free_shipping_after': instance.freeShippingAfter,
      'shipping_cost': instance.shippingCost,
    };
