// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VendorProfile _$VendorProfileFromJson(Map<String, dynamic> json) {
  return _VendorProfile.fromJson(json);
}

/// @nodoc
mixin _$VendorProfile {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get fullName => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get accountType => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String? get accCategory => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get lastLogin => throw _privateConstructorUsedError;
  String? get addressLine1 => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get addressLine2 => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get zip => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_category_id", defaultValue: [])
  List<String> get shopCategoryIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorProfileCopyWith<VendorProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorProfileCopyWith<$Res> {
  factory $VendorProfileCopyWith(
          VendorProfile value, $Res Function(VendorProfile) then) =
      _$VendorProfileCopyWithImpl<$Res, VendorProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(defaultValue: '') String fullName,
      String username,
      String phone,
      String? email,
      String? accountType,
      String businessName,
      String? accCategory,
      String? photo,
      int views,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      DateTime? lastLogin,
      String? addressLine1,
      String? city,
      String? about,
      String? addressLine2,
      String? country,
      String? state,
      String? zip,
      @JsonKey(name: "shop_category_id", defaultValue: [])
      List<String> shopCategoryIds});
}

/// @nodoc
class _$VendorProfileCopyWithImpl<$Res, $Val extends VendorProfile>
    implements $VendorProfileCopyWith<$Res> {
  _$VendorProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? username = null,
    Object? phone = null,
    Object? email = freezed,
    Object? accountType = freezed,
    Object? businessName = null,
    Object? accCategory = freezed,
    Object? photo = freezed,
    Object? views = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastLogin = freezed,
    Object? addressLine1 = freezed,
    Object? city = freezed,
    Object? about = freezed,
    Object? addressLine2 = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? zip = freezed,
    Object? shopCategoryIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      accCategory: freezed == accCategory
          ? _value.accCategory
          : accCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      zip: freezed == zip
          ? _value.zip
          : zip // ignore: cast_nullable_to_non_nullable
              as String?,
      shopCategoryIds: null == shopCategoryIds
          ? _value.shopCategoryIds
          : shopCategoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorProfileImplCopyWith<$Res>
    implements $VendorProfileCopyWith<$Res> {
  factory _$$VendorProfileImplCopyWith(
          _$VendorProfileImpl value, $Res Function(_$VendorProfileImpl) then) =
      __$$VendorProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(defaultValue: '') String fullName,
      String username,
      String phone,
      String? email,
      String? accountType,
      String businessName,
      String? accCategory,
      String? photo,
      int views,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      DateTime? lastLogin,
      String? addressLine1,
      String? city,
      String? about,
      String? addressLine2,
      String? country,
      String? state,
      String? zip,
      @JsonKey(name: "shop_category_id", defaultValue: [])
      List<String> shopCategoryIds});
}

/// @nodoc
class __$$VendorProfileImplCopyWithImpl<$Res>
    extends _$VendorProfileCopyWithImpl<$Res, _$VendorProfileImpl>
    implements _$$VendorProfileImplCopyWith<$Res> {
  __$$VendorProfileImplCopyWithImpl(
      _$VendorProfileImpl _value, $Res Function(_$VendorProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? username = null,
    Object? phone = null,
    Object? email = freezed,
    Object? accountType = freezed,
    Object? businessName = null,
    Object? accCategory = freezed,
    Object? photo = freezed,
    Object? views = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastLogin = freezed,
    Object? addressLine1 = freezed,
    Object? city = freezed,
    Object? about = freezed,
    Object? addressLine2 = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? zip = freezed,
    Object? shopCategoryIds = null,
  }) {
    return _then(_$VendorProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      accCategory: freezed == accCategory
          ? _value.accCategory
          : accCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      zip: freezed == zip
          ? _value.zip
          : zip // ignore: cast_nullable_to_non_nullable
              as String?,
      shopCategoryIds: null == shopCategoryIds
          ? _value._shopCategoryIds
          : shopCategoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$VendorProfileImpl implements _VendorProfile {
  const _$VendorProfileImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(defaultValue: '') required this.fullName,
      required this.username,
      required this.phone,
      this.email,
      this.accountType,
      required this.businessName,
      this.accCategory,
      this.photo,
      this.views = 0,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt,
      this.lastLogin,
      this.addressLine1,
      this.city,
      this.about,
      this.addressLine2,
      this.country,
      this.state,
      this.zip,
      @JsonKey(name: "shop_category_id", defaultValue: [])
      required final List<String> shopCategoryIds})
      : _shopCategoryIds = shopCategoryIds;

  factory _$VendorProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorProfileImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String fullName;
  @override
  final String username;
  @override
  final String phone;
  @override
  final String? email;
  @override
  final String? accountType;
  @override
  final String businessName;
  @override
  final String? accCategory;
  @override
  final String? photo;
  @override
  @JsonKey()
  final int views;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;
  @override
  final DateTime? lastLogin;
  @override
  final String? addressLine1;
  @override
  final String? city;
  @override
  final String? about;
  @override
  final String? addressLine2;
  @override
  final String? country;
  @override
  final String? state;
  @override
  final String? zip;
  final List<String> _shopCategoryIds;
  @override
  @JsonKey(name: "shop_category_id", defaultValue: [])
  List<String> get shopCategoryIds {
    if (_shopCategoryIds is EqualUnmodifiableListView) return _shopCategoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopCategoryIds);
  }

  @override
  String toString() {
    return 'VendorProfile(id: $id, fullName: $fullName, username: $username, phone: $phone, email: $email, accountType: $accountType, businessName: $businessName, accCategory: $accCategory, photo: $photo, views: $views, createdAt: $createdAt, updatedAt: $updatedAt, lastLogin: $lastLogin, addressLine1: $addressLine1, city: $city, about: $about, addressLine2: $addressLine2, country: $country, state: $state, zip: $zip, shopCategoryIds: $shopCategoryIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.accCategory, accCategory) ||
                other.accCategory == accCategory) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zip, zip) || other.zip == zip) &&
            const DeepCollectionEquality()
                .equals(other._shopCategoryIds, _shopCategoryIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        fullName,
        username,
        phone,
        email,
        accountType,
        businessName,
        accCategory,
        photo,
        views,
        createdAt,
        updatedAt,
        lastLogin,
        addressLine1,
        city,
        about,
        addressLine2,
        country,
        state,
        zip,
        const DeepCollectionEquality().hash(_shopCategoryIds)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorProfileImplCopyWith<_$VendorProfileImpl> get copyWith =>
      __$$VendorProfileImplCopyWithImpl<_$VendorProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorProfileImplToJson(
      this,
    );
  }
}

abstract class _VendorProfile implements VendorProfile {
  const factory _VendorProfile(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(defaultValue: '') required final String fullName,
      required final String username,
      required final String phone,
      final String? email,
      final String? accountType,
      required final String businessName,
      final String? accCategory,
      final String? photo,
      final int views,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "updatedAt") required final DateTime updatedAt,
      final DateTime? lastLogin,
      final String? addressLine1,
      final String? city,
      final String? about,
      final String? addressLine2,
      final String? country,
      final String? state,
      final String? zip,
      @JsonKey(name: "shop_category_id", defaultValue: [])
      required final List<String> shopCategoryIds}) = _$VendorProfileImpl;

  factory _VendorProfile.fromJson(Map<String, dynamic> json) =
      _$VendorProfileImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get fullName;
  @override
  String get username;
  @override
  String get phone;
  @override
  String? get email;
  @override
  String? get accountType;
  @override
  String get businessName;
  @override
  String? get accCategory;
  @override
  String? get photo;
  @override
  int get views;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;
  @override
  DateTime? get lastLogin;
  @override
  String? get addressLine1;
  @override
  String? get city;
  @override
  String? get about;
  @override
  String? get addressLine2;
  @override
  String? get country;
  @override
  String? get state;
  @override
  String? get zip;
  @override
  @JsonKey(name: "shop_category_id", defaultValue: [])
  List<String> get shopCategoryIds;
  @override
  @JsonKey(ignore: true)
  _$$VendorProfileImplCopyWith<_$VendorProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
