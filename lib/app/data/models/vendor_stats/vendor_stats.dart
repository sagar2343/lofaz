import 'package:freezed_annotation/freezed_annotation.dart';
part 'vendor_stats.freezed.dart';
part 'vendor_stats.g.dart';

@freezed
class VendorStats with _$VendorStats {
  const VendorStats._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VendorStats({
    @JsonKey(defaultValue: 0) required int totalOrder,
    @JsonKey(defaultValue: 0) required int totalAmount,
    @JsonKey(defaultValue: 0) required int totalCart,
    @JsonKey(defaultValue: 0) required int totalWishlist,
  }) = _VendorStats;

  factory VendorStats.fromJson(Map<String, dynamic> json) =>
      _$VendorStatsFromJson(json);

  factory VendorStats.empty() => const VendorStats(
        totalOrder: 0,
        totalAmount: 0,
        totalCart: 0,
        totalWishlist: 0,
      );
}
