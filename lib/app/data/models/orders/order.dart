// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lofaz/app/data/models/orders/order_info.dart';
part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Order({
    @JsonKey(name: "_id") required String id,
    // required int orderNo,
    required List<OrderProductInfo> product,
    String? userId,
    required String custId,
    String? shippingName,
    @JsonKey(fromJson: intToString) String? shippingPhone,
    // String? userAddressLine1,
    // String? userAddressLine2,
    // String? userCity,
    // String? userState,
    // String? userZip,
    // String? userCountry,
    // @JsonKey(fromJson: intToString) String? userPhone,
    String? shippingAddress1,
    String? shippingAddress2,
    String? shippingCountry,
    String? shippingState,
    String? shippingCity,
    @JsonKey(fromJson: intToString) String? shippingZip,
    @Default(false) bool pendingStatus,
    // DateTime? pendingDate,
    @Default(false) bool acceptStatus,
    // DateTime? acceptDate,
    @Default(false) bool shippedStatus,
    // DateTime? shippedDate,
    @Default(false) bool deliverStatus,
    // DateTime? deliverDate,
    @Default(false) bool cancelStatus,
    // DateTime? cancelDate,
    // required String currency,
    String? note,
    OrderShippingCharge? shippingCharge,
    required String grandTotal,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    // required String cancelledBy,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    required List<OrderStatus> status,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

String intToString(data) {
  return data.toString();
}

@freezed
class OrderProductInfo with _$OrderProductInfo {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory OrderProductInfo({
    required String prodId,
    String? img,
    required double price,
    required String title,
    required double total,
    required double qty,
  }) = _OrderProductInfo;

  factory OrderProductInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderProductInfoFromJson(json);
}
