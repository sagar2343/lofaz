// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['_id'] as String,
      product: (json['product'] as List<dynamic>)
          .map((e) => OrderProductInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['user_id'] as String?,
      custId: json['cust_id'] as String,
      shippingName: json['shipping_name'] as String?,
      shippingPhone: intToString(json['shipping_phone']),
      shippingAddress1: json['shipping_address1'] as String?,
      shippingAddress2: json['shipping_address2'] as String?,
      shippingCountry: json['shipping_country'] as String?,
      shippingState: json['shipping_state'] as String?,
      shippingCity: json['shipping_city'] as String?,
      shippingZip: intToString(json['shipping_zip']),
      pendingStatus: json['pending_status'] as bool? ?? false,
      acceptStatus: json['accept_status'] as bool? ?? false,
      shippedStatus: json['shipped_status'] as bool? ?? false,
      deliverStatus: json['deliver_status'] as bool? ?? false,
      cancelStatus: json['cancel_status'] as bool? ?? false,
      note: json['note'] as String?,
      shippingCharge: json['shipping_charge'] == null
          ? null
          : OrderShippingCharge.fromJson(
              json['shipping_charge'] as Map<String, dynamic>),
      grandTotal: json['grand_total'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      status: (json['status'] as List<dynamic>)
          .map((e) => OrderStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'product': instance.product,
      'user_id': instance.userId,
      'cust_id': instance.custId,
      'shipping_name': instance.shippingName,
      'shipping_phone': instance.shippingPhone,
      'shipping_address1': instance.shippingAddress1,
      'shipping_address2': instance.shippingAddress2,
      'shipping_country': instance.shippingCountry,
      'shipping_state': instance.shippingState,
      'shipping_city': instance.shippingCity,
      'shipping_zip': instance.shippingZip,
      'pending_status': instance.pendingStatus,
      'accept_status': instance.acceptStatus,
      'shipped_status': instance.shippedStatus,
      'deliver_status': instance.deliverStatus,
      'cancel_status': instance.cancelStatus,
      'note': instance.note,
      'shipping_charge': instance.shippingCharge,
      'grand_total': instance.grandTotal,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'status': instance.status,
    };

_$OrderProductInfoImpl _$$OrderProductInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderProductInfoImpl(
      prodId: json['prod_id'] as String,
      img: json['img'] as String?,
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      total: (json['total'] as num).toDouble(),
      qty: (json['qty'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderProductInfoImplToJson(
        _$OrderProductInfoImpl instance) =>
    <String, dynamic>{
      'prod_id': instance.prodId,
      'img': instance.img,
      'price': instance.price,
      'title': instance.title,
      'total': instance.total,
      'qty': instance.qty,
    };
