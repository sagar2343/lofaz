import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/orders/order.dart';
part 'filtered_order_page_arguments.freezed.dart';

@freezed
class FilteredOrderPageArguments with _$FilteredOrderPageArguments {
  const factory FilteredOrderPageArguments({
    required String title,
    required List<Order> order,
  }) = _FilteredOrderPageArguments;
}
