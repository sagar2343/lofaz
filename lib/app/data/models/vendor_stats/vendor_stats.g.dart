// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorStatsImpl _$$VendorStatsImplFromJson(Map<String, dynamic> json) =>
    _$VendorStatsImpl(
      totalOrder: json['total_order'] as int? ?? 0,
      totalAmount: json['total_amount'] as int? ?? 0,
      totalCart: json['total_cart'] as int? ?? 0,
      totalWishlist: json['total_wishlist'] as int? ?? 0,
    );

Map<String, dynamic> _$$VendorStatsImplToJson(_$VendorStatsImpl instance) =>
    <String, dynamic>{
      'total_order': instance.totalOrder,
      'total_amount': instance.totalAmount,
      'total_cart': instance.totalCart,
      'total_wishlist': instance.totalWishlist,
    };
