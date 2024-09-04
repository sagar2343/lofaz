// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatalogResponseImpl _$$CatalogResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CatalogResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Catalog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: json['total'] as int,
    );

Map<String, dynamic> _$$CatalogResponseImplToJson(
        _$CatalogResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

_$CatalogImpl _$$CatalogImplFromJson(Map<String, dynamic> json) =>
    _$CatalogImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      status: json['status'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CatalogImplToJson(_$CatalogImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'photos': instance.photos,
    };
