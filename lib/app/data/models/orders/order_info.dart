// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lofaz/app/data/models/orders/order.dart';
part 'order_info.freezed.dart';
part 'order_info.g.dart';

@freezed
class OrderInfo with _$OrderInfo {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory OrderInfo({
    required List<OrderItem> orderItem,
    required RemoteOrder order,
  }) = _OrderInfo;

  factory OrderInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoFromJson(json);
}

@freezed
class RemoteOrder with _$RemoteOrder {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory RemoteOrder({
    required ShippingLocation shippingLocation,
    required OrderShippingCharge shippingCharge,
    @JsonKey(name: "_id") required String id,
    VendorHasCustomerId? vendorHasCustomerId,
    required List<OrderStatus> status,
    required int total,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
  }) = _Order;

  factory RemoteOrder.fromJson(Map<String, dynamic> json) =>
      _$RemoteOrderFromJson(json);
}

@freezed
class OrderShippingCharge with _$OrderShippingCharge {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory OrderShippingCharge({
    required String type,
    required double amount,
  }) = _ShippingCharge;

  factory OrderShippingCharge.fromJson(Map<String, dynamic> json) =>
      _$OrderShippingChargeFromJson(json);
}

@freezed
class ShippingLocation with _$ShippingLocation {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory ShippingLocation({
    required String type,
    required List<String> address,
    required String city,
    required String zipCode,
    required String state,
    required String country,
  }) = _ShippingLocation;

  factory ShippingLocation.fromJson(Map<String, dynamic> json) =>
      _$ShippingLocationFromJson(json);
}

@freezed
class OrderStatus with _$OrderStatus {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory OrderStatus({
    required String type,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
    @JsonKey(name: "_id") required String id,
  }) = _Status;

  factory OrderStatus.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusFromJson(json);
}

@freezed
class VendorHasCustomerId with _$VendorHasCustomerId {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory VendorHasCustomerId({
    @JsonKey(name: "_id") required String id,
    required CustomerId customerId,
  }) = _VendorHasCustomerId;

  factory VendorHasCustomerId.fromJson(Map<String, dynamic> json) =>
      _$VendorHasCustomerIdFromJson(json);
}

@freezed
class CustomerId with _$CustomerId {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory CustomerId({
    @JsonKey(name: "_id") required String id,
    required ProfileId profileId,
  }) = _CustomerId;

  factory CustomerId.fromJson(Map<String, dynamic> json) =>
      _$CustomerIdFromJson(json);
}

@freezed
class ProfileId with _$ProfileId {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory ProfileId({
    required Name name,
    @JsonKey(name: "_id") required String id,
    required int phone,
  }) = _ProfileId;

  factory ProfileId.fromJson(Map<String, dynamic> json) =>
      _$ProfileIdFromJson(json);
}

@freezed
class Name with _$Name {
  const factory Name({
    String? first,
    String? last,
  }) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory OrderItem({
    required OrderProduct product,
    @JsonKey(name: "_id") required String id,
    required String orderId,
    required int quantity,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
class OrderProduct with _$OrderProduct {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory OrderProduct({
    required String productId,
    required String title,
    required String url,
    required int salesPrice,
    required int mrp,
    required String desc,
    required String featuredImg,
  }) = _Product;

  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);
}

extension OrderInfoX on OrderInfo {
  Order getOrder() {
    return Order(
      id: order.id,

      product: orderItem
          .map((e) => OrderProductInfo(
                img: e.product.featuredImg,
                prodId: e.product.productId,
                price: e.product.salesPrice.toDouble(),
                title: e.product.title,
                total: e.quantity * e.product.salesPrice.toDouble(),
                qty: e.quantity.toDouble(),
              ))
          .toList(),
      custId: order.vendorHasCustomerId?.customerId.id ?? "",
      grandTotal: order.total.toString(),
      createdAt: order.createdAt,
      // pendingStatus: true,
      status: order.status,
      acceptStatus: order.status.last.type == "accepted",
      pendingStatus: order.status.last.type == "pending",
      shippedStatus: order.status.last.type == "shipped",
      deliverStatus: order.status.last.type == "delivered",
      cancelStatus: order.status.last.type == "cancelled",
      shippingCharge: order.shippingCharge,
      shippingAddress1: "${order.shippingLocation.address.join(
        ", ",
      )}\n${order.shippingLocation.city}, ${order.shippingLocation.state}, ${order.shippingLocation.country}",
      shippingCity: order.shippingLocation.city,
      shippingCountry: order.shippingLocation.country,
      shippingState: order.shippingLocation.state,
      shippingZip: order.shippingLocation.zipCode,
      shippingName:
          order.vendorHasCustomerId?.customerId.profileId.name.first ?? "",
      shippingPhone:
          order.vendorHasCustomerId?.customerId.profileId.phone.toString(),
      updatedAt: order.updatedAt,
    );
  }
}
