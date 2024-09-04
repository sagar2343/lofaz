// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return _Vendor.fromJson(json);
}

/// @nodoc
mixin _$Vendor {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get surnameName => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<String> get shopCategoryId => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [], readValue: parseImage)
  List<String> get logo => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorCopyWith<Vendor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCopyWith<$Res> {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) then) =
      _$VendorCopyWithImpl<$Res, Vendor>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(defaultValue: '') String firstName,
      @JsonKey(defaultValue: '') String surnameName,
      String username,
      String phone,
      @JsonKey(defaultValue: []) List<String> shopCategoryId,
      String businessName,
      String? photo,
      @JsonKey(defaultValue: [], readValue: parseImage) List<String> logo,
      int views,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$VendorCopyWithImpl<$Res, $Val extends Vendor>
    implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? surnameName = null,
    Object? username = null,
    Object? phone = null,
    Object? shopCategoryId = null,
    Object? businessName = null,
    Object? photo = freezed,
    Object? logo = null,
    Object? views = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      surnameName: null == surnameName
          ? _value.surnameName
          : surnameName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      shopCategoryId: null == shopCategoryId
          ? _value.shopCategoryId
          : shopCategoryId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorImplCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$$VendorImplCopyWith(
          _$VendorImpl value, $Res Function(_$VendorImpl) then) =
      __$$VendorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(defaultValue: '') String firstName,
      @JsonKey(defaultValue: '') String surnameName,
      String username,
      String phone,
      @JsonKey(defaultValue: []) List<String> shopCategoryId,
      String businessName,
      String? photo,
      @JsonKey(defaultValue: [], readValue: parseImage) List<String> logo,
      int views,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$VendorImplCopyWithImpl<$Res>
    extends _$VendorCopyWithImpl<$Res, _$VendorImpl>
    implements _$$VendorImplCopyWith<$Res> {
  __$$VendorImplCopyWithImpl(
      _$VendorImpl _value, $Res Function(_$VendorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? surnameName = null,
    Object? username = null,
    Object? phone = null,
    Object? shopCategoryId = null,
    Object? businessName = null,
    Object? photo = freezed,
    Object? logo = null,
    Object? views = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$VendorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      surnameName: null == surnameName
          ? _value.surnameName
          : surnameName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      shopCategoryId: null == shopCategoryId
          ? _value._shopCategoryId
          : shopCategoryId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: null == logo
          ? _value._logo
          : logo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$VendorImpl implements _Vendor {
  const _$VendorImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(defaultValue: '') required this.firstName,
      @JsonKey(defaultValue: '') required this.surnameName,
      required this.username,
      required this.phone,
      @JsonKey(defaultValue: []) required final List<String> shopCategoryId,
      required this.businessName,
      this.photo,
      @JsonKey(defaultValue: [], readValue: parseImage)
      required final List<String> logo,
      this.views = 0,
      this.createdAt,
      this.updatedAt})
      : _shopCategoryId = shopCategoryId,
        _logo = logo;

  factory _$VendorImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String firstName;
  @override
  @JsonKey(defaultValue: '')
  final String surnameName;
  @override
  final String username;
  @override
  final String phone;
  final List<String> _shopCategoryId;
  @override
  @JsonKey(defaultValue: [])
  List<String> get shopCategoryId {
    if (_shopCategoryId is EqualUnmodifiableListView) return _shopCategoryId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopCategoryId);
  }

  @override
  final String businessName;
  @override
  final String? photo;
  final List<String> _logo;
  @override
  @JsonKey(defaultValue: [], readValue: parseImage)
  List<String> get logo {
    if (_logo is EqualUnmodifiableListView) return _logo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logo);
  }

  @override
  @JsonKey()
  final int views;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Vendor(id: $id, firstName: $firstName, surnameName: $surnameName, username: $username, phone: $phone, shopCategoryId: $shopCategoryId, businessName: $businessName, photo: $photo, logo: $logo, views: $views, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.surnameName, surnameName) ||
                other.surnameName == surnameName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other._shopCategoryId, _shopCategoryId) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            const DeepCollectionEquality().equals(other._logo, _logo) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      surnameName,
      username,
      phone,
      const DeepCollectionEquality().hash(_shopCategoryId),
      businessName,
      photo,
      const DeepCollectionEquality().hash(_logo),
      views,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      __$$VendorImplCopyWithImpl<_$VendorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorImplToJson(
      this,
    );
  }
}

abstract class _Vendor implements Vendor {
  const factory _Vendor(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(defaultValue: '') required final String firstName,
      @JsonKey(defaultValue: '') required final String surnameName,
      required final String username,
      required final String phone,
      @JsonKey(defaultValue: []) required final List<String> shopCategoryId,
      required final String businessName,
      final String? photo,
      @JsonKey(defaultValue: [], readValue: parseImage)
      required final List<String> logo,
      final int views,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$VendorImpl;

  factory _Vendor.fromJson(Map<String, dynamic> json) = _$VendorImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get firstName;
  @override
  @JsonKey(defaultValue: '')
  String get surnameName;
  @override
  String get username;
  @override
  String get phone;
  @override
  @JsonKey(defaultValue: [])
  List<String> get shopCategoryId;
  @override
  String get businessName;
  @override
  String? get photo;
  @override
  @JsonKey(defaultValue: [], readValue: parseImage)
  List<String> get logo;
  @override
  int get views;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
