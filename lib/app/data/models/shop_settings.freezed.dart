// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopSettings _$ShopSettingsFromJson(Map<String, dynamic> json) {
  return _ShopSettings.fromJson(json);
}

/// @nodoc
mixin _$ShopSettings {
  bool get orderStatus => throw _privateConstructorUsedError;
  bool get shopStatus => throw _privateConstructorUsedError;
  bool get whatsappStatus => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopSettingsCopyWith<ShopSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopSettingsCopyWith<$Res> {
  factory $ShopSettingsCopyWith(
          ShopSettings value, $Res Function(ShopSettings) then) =
      _$ShopSettingsCopyWithImpl<$Res, ShopSettings>;
  @useResult
  $Res call(
      {bool orderStatus, bool shopStatus, bool whatsappStatus, String? userId});
}

/// @nodoc
class _$ShopSettingsCopyWithImpl<$Res, $Val extends ShopSettings>
    implements $ShopSettingsCopyWith<$Res> {
  _$ShopSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
    Object? shopStatus = null,
    Object? whatsappStatus = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      shopStatus: null == shopStatus
          ? _value.shopStatus
          : shopStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      whatsappStatus: null == whatsappStatus
          ? _value.whatsappStatus
          : whatsappStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopSettingsImplCopyWith<$Res>
    implements $ShopSettingsCopyWith<$Res> {
  factory _$$ShopSettingsImplCopyWith(
          _$ShopSettingsImpl value, $Res Function(_$ShopSettingsImpl) then) =
      __$$ShopSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool orderStatus, bool shopStatus, bool whatsappStatus, String? userId});
}

/// @nodoc
class __$$ShopSettingsImplCopyWithImpl<$Res>
    extends _$ShopSettingsCopyWithImpl<$Res, _$ShopSettingsImpl>
    implements _$$ShopSettingsImplCopyWith<$Res> {
  __$$ShopSettingsImplCopyWithImpl(
      _$ShopSettingsImpl _value, $Res Function(_$ShopSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
    Object? shopStatus = null,
    Object? whatsappStatus = null,
    Object? userId = freezed,
  }) {
    return _then(_$ShopSettingsImpl(
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      shopStatus: null == shopStatus
          ? _value.shopStatus
          : shopStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      whatsappStatus: null == whatsappStatus
          ? _value.whatsappStatus
          : whatsappStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ShopSettingsImpl implements _ShopSettings {
  const _$ShopSettingsImpl(
      {this.orderStatus = false,
      this.shopStatus = false,
      this.whatsappStatus = false,
      this.userId});

  factory _$ShopSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool orderStatus;
  @override
  @JsonKey()
  final bool shopStatus;
  @override
  @JsonKey()
  final bool whatsappStatus;
  @override
  final String? userId;

  @override
  String toString() {
    return 'ShopSettings(orderStatus: $orderStatus, shopStatus: $shopStatus, whatsappStatus: $whatsappStatus, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopSettingsImpl &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.shopStatus, shopStatus) ||
                other.shopStatus == shopStatus) &&
            (identical(other.whatsappStatus, whatsappStatus) ||
                other.whatsappStatus == whatsappStatus) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderStatus, shopStatus, whatsappStatus, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopSettingsImplCopyWith<_$ShopSettingsImpl> get copyWith =>
      __$$ShopSettingsImplCopyWithImpl<_$ShopSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopSettingsImplToJson(
      this,
    );
  }
}

abstract class _ShopSettings implements ShopSettings {
  const factory _ShopSettings(
      {final bool orderStatus,
      final bool shopStatus,
      final bool whatsappStatus,
      final String? userId}) = _$ShopSettingsImpl;

  factory _ShopSettings.fromJson(Map<String, dynamic> json) =
      _$ShopSettingsImpl.fromJson;

  @override
  bool get orderStatus;
  @override
  bool get shopStatus;
  @override
  bool get whatsappStatus;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$ShopSettingsImplCopyWith<_$ShopSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
