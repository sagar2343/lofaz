// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingleOrderResponseImpl _$$SingleOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleOrderResponseImpl(
      product: OrderProduct.fromJson(json['product'] as Map<String, dynamic>),
      id: json['_id'] as String,
      orderId: RemoteOrder.fromJson(json['order_id'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SingleOrderResponseImplToJson(
        _$SingleOrderResponseImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      '_id': instance.id,
      'order_id': instance.orderId,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
