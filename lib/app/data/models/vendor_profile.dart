// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'vendor_profile.freezed.dart';
part 'vendor_profile.g.dart';

@freezed
class VendorProfile with _$VendorProfile {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory VendorProfile({
    @JsonKey(name: "_id") required String id,
    @JsonKey(defaultValue: '') required String fullName,
    required String username,
    required String phone,
    String? email,
    String? accountType,
    required String businessName,
    String? accCategory,
    String? photo,
    @Default(0) int views,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
    DateTime? lastLogin,
    String? addressLine1,
    String? city,
    String? about,
    String? addressLine2,
    String? country,
    String? state,
    String? zip,
    @JsonKey(name: "shop_category_id", defaultValue: [])
    required List<String> shopCategoryIds,
  }) = _VendorProfile;

  factory VendorProfile.fromJson(Map<String, dynamic> json) =>
      _$VendorProfileFromJson(json);
}
