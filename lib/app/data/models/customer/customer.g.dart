// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerResponseImpl _$$CustomerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$$CustomerResponseImplToJson(
        _$CustomerResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['_id'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      profile: Profile.fromJson(
          parseProfile(json, 'profile') as Map<String, dynamic>),
      total: Total.fromJson(json['total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'profile': instance.profile,
      'total': instance.total,
    };

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      phone: json['phone'] as int? ?? 0,
      location: (json['location'] as List<dynamic>?)
              ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fullName: json['full_name'] as String? ?? '',
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'location': instance.location,
      'full_name': instance.fullName,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      type: json['type'] as String? ?? '',
      address: (json['address'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      zipCode: json['zip_code'] as String? ?? '',
      country: json['country'] as String? ?? '',
      id: json['_id'] as String? ?? '',
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
      'country': instance.country,
      '_id': instance.id,
    };

_$TotalImpl _$$TotalImplFromJson(Map<String, dynamic> json) => _$TotalImpl(
      wishlist: json['wishlist'] as int? ?? 0,
      cart: json['cart'] as int? ?? 0,
      order: json['order'] as int? ?? 0,
    );

Map<String, dynamic> _$$TotalImplToJson(_$TotalImpl instance) =>
    <String, dynamic>{
      'wishlist': instance.wishlist,
      'cart': instance.cart,
      'order': instance.order,
    };
