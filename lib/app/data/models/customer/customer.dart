// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class CustomerResponse with _$CustomerResponse {
  const factory CustomerResponse({
    @JsonKey(defaultValue: []) required List<Customer> data,
    @JsonKey(name: 'total', defaultValue: 0) required int total,
  }) = _CustomerResponse;

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
}

@freezed
class Customer with _$Customer {
  const factory Customer({
    @JsonKey(
      defaultValue: '',
      name: '_id',
    )
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    @JsonKey(readValue: parseProfile) required Profile profile,
    required Total total,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

extension CustomerX on Customer {
  Location get address => profile.location.firstOrNull ?? Location.empty();
}

parseProfile(Map data, String key) {
  if (data[key] == null) return <String, dynamic>{};
  return data[key];
}

@freezed
class Profile with _$Profile {
  const factory Profile({
    @JsonKey(
      defaultValue: 0,
    )
    required int phone,
    @JsonKey(
      defaultValue: [],
    )
    required List<Location> location,
    @JsonKey(
      defaultValue: '',
      name: 'full_name',
    )
    required String fullName,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  factory Profile.empty() =>
      const Profile(phone: 0, location: [], fullName: '');
}

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(
      defaultValue: '',
    )
    required String type,
    @JsonKey(
      defaultValue: [],
    )
    required List<String> address,
    @JsonKey(
      defaultValue: '',
    )
    required String city,
    @JsonKey(
      defaultValue: '',
    )
    required String state,
    @JsonKey(
      defaultValue: '',
      name: 'zip_code',
    )
    required String zipCode,
    @JsonKey(
      defaultValue: '',
    )
    required String country,
    @JsonKey(
      defaultValue: '',
      name: '_id',
    )
    required String id,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  factory Location.empty() => const Location(
        type: '',
        address: [],
        city: '',
        state: '',
        zipCode: '',
        country: '',
        id: '',
      );
}

@freezed
class Total with _$Total {
  const factory Total({
    @JsonKey(
      defaultValue: 0,
    )
    required int wishlist,
    @JsonKey(
      defaultValue: 0,
    )
    required int cart,
    @JsonKey(
      defaultValue: 0,
    )
    required int order,
  }) = _Total;

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);
}

enum CustomerSortOption {
  createdAt('createdAt'),
  updatedAt('updatedAt'),
  wishlistCount('total.wishlist'),
  cartCount('total.cart'),
  orderCount('total.order');

  const CustomerSortOption(this.value);

  final String value;
}

extension CustomerSortOptionX on CustomerSortOption {
  String get displayName {
    switch (this) {
      case CustomerSortOption.createdAt:
        return 'Created Date';
      case CustomerSortOption.updatedAt:
        return 'Last Updated';
      case CustomerSortOption.wishlistCount:
        return 'Wishlist Count';
      case CustomerSortOption.cartCount:
        return 'Cart Count';
      case CustomerSortOption.orderCount:
        return 'Order Count';
    }
  }
}
