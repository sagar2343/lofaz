// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsResponseImpl _$$ProductsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductsResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: json['total'] as int,
    );

Map<String, dynamic> _$$ProductsResponseImplToJson(
        _$ProductsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      salesPrice: (json['sales_price'] as num).toDouble(),
      mrp: (json['mrp'] as num).toDouble(),
      desc: json['desc'] as String,
      featuredImg: json['featured_img'] as String?,
      photo: (json['photo'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : PhotoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      trends: json['trends'] as String?,
      unitCount: (json['unit_count'] as num).toDouble(),
      unit: json['unit'] as String,
      userId: json['user_id'] as String,
      status: json['status'] as bool,
      views: json['views'] as int,
      category: Catalog.fromJson(json['category'] as Map<String, dynamic>),
      stock: json['stock'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      catStatus: json['cat_status'] as bool?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'sales_price': instance.salesPrice,
      'mrp': instance.mrp,
      'desc': instance.desc,
      'featured_img': instance.featuredImg,
      'photo': instance.photo,
      'trends': instance.trends,
      'unit_count': instance.unitCount,
      'unit': instance.unit,
      'user_id': instance.userId,
      'status': instance.status,
      'views': instance.views,
      'category': instance.category,
      'stock': instance.stock,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'cat_status': instance.catStatus,
    };

_$PhotoImpl _$$PhotoImplFromJson(Map<String, dynamic> json) => _$PhotoImpl(
      location: json['location'] as String,
      key: json['key'] as String?,
      eTag: json['eTag'],
      serverSideEncryption: json['serverSideEncryption'] as String?,
      bucket: json['bucket'] as String? ?? "",
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$PhotoImplToJson(_$PhotoImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'key': instance.key,
      'eTag': instance.eTag,
      'serverSideEncryption': instance.serverSideEncryption,
      'bucket': instance.bucket,
      '_id': instance.id,
    };
