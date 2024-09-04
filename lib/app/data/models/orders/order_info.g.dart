// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderInfoImpl _$$OrderInfoImplFromJson(Map<String, dynamic> json) =>
    _$OrderInfoImpl(
      orderItem: (json['order_item'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: RemoteOrder.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderInfoImplToJson(_$OrderInfoImpl instance) =>
    <String, dynamic>{
      'order_item': instance.orderItem,
      'order': instance.order,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      shippingLocation: ShippingLocation.fromJson(
          json['shipping_location'] as Map<String, dynamic>),
      shippingCharge: OrderShippingCharge.fromJson(
          json['shipping_charge'] as Map<String, dynamic>),
      id: json['_id'] as String,
      vendorHasCustomerId: json['vendor_has_customer_id'] == null
          ? null
          : VendorHasCustomerId.fromJson(
              json['vendor_has_customer_id'] as Map<String, dynamic>),
      status: (json['status'] as List<dynamic>)
          .map((e) => OrderStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'shipping_location': instance.shippingLocation,
      'shipping_charge': instance.shippingCharge,
      '_id': instance.id,
      'vendor_has_customer_id': instance.vendorHasCustomerId,
      'status': instance.status,
      'total': instance.total,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ShippingChargeImpl _$$ShippingChargeImplFromJson(Map<String, dynamic> json) =>
    _$ShippingChargeImpl(
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$ShippingChargeImplToJson(
        _$ShippingChargeImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
    };

_$ShippingLocationImpl _$$ShippingLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$ShippingLocationImpl(
      type: json['type'] as String,
      address:
          (json['address'] as List<dynamic>).map((e) => e as String).toList(),
      city: json['city'] as String,
      zipCode: json['zip_code'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$ShippingLocationImplToJson(
        _$ShippingLocationImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'address': instance.address,
      'city': instance.city,
      'zip_code': instance.zipCode,
      'state': instance.state,
      'country': instance.country,
    };

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '_id': instance.id,
    };

_$VendorHasCustomerIdImpl _$$VendorHasCustomerIdImplFromJson(
        Map<String, dynamic> json) =>
    _$VendorHasCustomerIdImpl(
      id: json['_id'] as String,
      customerId:
          CustomerId.fromJson(json['customer_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VendorHasCustomerIdImplToJson(
        _$VendorHasCustomerIdImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'customer_id': instance.customerId,
    };

_$CustomerIdImpl _$$CustomerIdImplFromJson(Map<String, dynamic> json) =>
    _$CustomerIdImpl(
      id: json['_id'] as String,
      profileId: ProfileId.fromJson(json['profile_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerIdImplToJson(_$CustomerIdImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'profile_id': instance.profileId,
    };

_$ProfileIdImpl _$$ProfileIdImplFromJson(Map<String, dynamic> json) =>
    _$ProfileIdImpl(
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      id: json['_id'] as String,
      phone: json['phone'] as int,
    );

Map<String, dynamic> _$$ProfileIdImplToJson(_$ProfileIdImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      '_id': instance.id,
      'phone': instance.phone,
    };

_$NameImpl _$$NameImplFromJson(Map<String, dynamic> json) => _$NameImpl(
      first: json['first'] as String?,
      last: json['last'] as String?,
    );

Map<String, dynamic> _$$NameImplToJson(_$NameImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
    };

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      product: OrderProduct.fromJson(json['product'] as Map<String, dynamic>),
      id: json['_id'] as String,
      orderId: json['order_id'] as String,
      quantity: json['quantity'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      '_id': instance.id,
      'order_id': instance.orderId,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: json['product_id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      salesPrice: json['sales_price'] as int,
      mrp: json['mrp'] as int,
      desc: json['desc'] as String,
      featuredImg: json['featured_img'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'title': instance.title,
      'url': instance.url,
      'sales_price': instance.salesPrice,
      'mrp': instance.mrp,
      'desc': instance.desc,
      'featured_img': instance.featuredImg,
    };
