// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorProfileImpl _$$VendorProfileImplFromJson(Map<String, dynamic> json) =>
    _$VendorProfileImpl(
      id: json['_id'] as String,
      fullName: json['full_name'] as String? ?? '',
      username: json['username'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      accountType: json['account_type'] as String?,
      businessName: json['business_name'] as String,
      accCategory: json['acc_category'] as String?,
      photo: json['photo'] as String?,
      views: json['views'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      addressLine1: json['address_line1'] as String?,
      city: json['city'] as String?,
      about: json['about'] as String?,
      addressLine2: json['address_line2'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      zip: json['zip'] as String?,
      shopCategoryIds: (json['shop_category_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$VendorProfileImplToJson(_$VendorProfileImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'full_name': instance.fullName,
      'username': instance.username,
      'phone': instance.phone,
      'email': instance.email,
      'account_type': instance.accountType,
      'business_name': instance.businessName,
      'acc_category': instance.accCategory,
      'photo': instance.photo,
      'views': instance.views,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'last_login': instance.lastLogin?.toIso8601String(),
      'address_line1': instance.addressLine1,
      'city': instance.city,
      'about': instance.about,
      'address_line2': instance.addressLine2,
      'country': instance.country,
      'state': instance.state,
      'zip': instance.zip,
      'shop_category_id': instance.shopCategoryIds,
    };
