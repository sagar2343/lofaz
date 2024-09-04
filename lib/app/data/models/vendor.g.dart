// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorImpl _$$VendorImplFromJson(Map<String, dynamic> json) => _$VendorImpl(
      id: json['_id'] as String,
      firstName: json['first_name'] as String? ?? '',
      surnameName: json['surname_name'] as String? ?? '',
      username: json['username'] as String,
      phone: json['phone'] as String,
      shopCategoryId: (json['shop_category_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      businessName: json['business_name'] as String,
      photo: json['photo'] as String?,
      logo: (parseImage(json, 'logo') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      views: json['views'] as int? ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$VendorImplToJson(_$VendorImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'surname_name': instance.surnameName,
      'username': instance.username,
      'phone': instance.phone,
      'shop_category_id': instance.shopCategoryId,
      'business_name': instance.businessName,
      'photo': instance.photo,
      'logo': instance.logo,
      'views': instance.views,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
