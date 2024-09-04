// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lofaz/app/data/models/orders/order_info.dart';

import 'order.dart';
part 'single_order_response.freezed.dart';
part 'single_order_response.g.dart';

@freezed
class SingleProductOrderResponse with _$SingleProductOrderResponse {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory SingleProductOrderResponse({
    required OrderProduct product,
    @JsonKey(name: "_id") required String id,
    required RemoteOrder orderId,
    required int quantity,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
  }) = _SingleOrderResponse;

  factory SingleProductOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleProductOrderResponseFromJson(json);
}

extension SingleProductOrderResponseX on List<SingleProductOrderResponse> {
  getOrder() {
    return Order(
      id: first.orderId.id,
      status: first.orderId.status,
      createdAt: first.orderId.createdAt,
      updatedAt: first.orderId.updatedAt,
      product: map((e) => OrderProductInfo(
          img: e.product.featuredImg,
          prodId: e.product.productId,
          price: e.product.salesPrice.toDouble(),
          title: e.product.title,
          total: e.quantity * e.product.salesPrice.toDouble(),
          qty: e.quantity.toDouble())).toList(),
      custId: first.orderId.vendorHasCustomerId?.customerId.id ?? "",
      grandTotal: first.orderId.total.toString(),
      acceptStatus: first.orderId.status.last.type == "accepted",
      pendingStatus: first.orderId.status.last.type == "pending",
      shippedStatus: first.orderId.status.last.type == "shipped",
      deliverStatus: first.orderId.status.last.type == "delivered",
      cancelStatus: first.orderId.status.last.type == "cancelled",
      shippingCharge: first.orderId.shippingCharge,
      shippingAddress1: "${first.orderId.shippingLocation.address.join(
        ", ",
      )}\n${first.orderId.shippingLocation.city}, ${first.orderId.shippingLocation.state}, ${first.orderId.shippingLocation.country}",
      shippingCity: first.orderId.shippingLocation.city,
      shippingCountry: first.orderId.shippingLocation.country,
      shippingState: first.orderId.shippingLocation.state,
      shippingZip: first.orderId.shippingLocation.zipCode,
      shippingName:
          first.orderId.vendorHasCustomerId?.customerId.profileId.name.first ??
              "",
      shippingPhone: first
          .orderId.vendorHasCustomerId?.customerId.profileId.phone
          .toString(),
    );
  }
}
