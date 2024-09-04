// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_charge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShippingCharge _$ShippingChargeFromJson(Map<String, dynamic> json) {
  return _ShippingCharge.fromJson(json);
}

/// @nodoc
mixin _$ShippingCharge {
  @JsonKey(name: 'free_shipping_after')
  double? get freeShippingAfter => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_cost')
  double? get shippingCost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShippingChargeCopyWith<ShippingCharge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingChargeCopyWith<$Res> {
  factory $ShippingChargeCopyWith(
          ShippingCharge value, $Res Function(ShippingCharge) then) =
      _$ShippingChargeCopyWithImpl<$Res, ShippingCharge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'free_shipping_after') double? freeShippingAfter,
      @JsonKey(name: 'shipping_cost') double? shippingCost});
}

/// @nodoc
class _$ShippingChargeCopyWithImpl<$Res, $Val extends ShippingCharge>
    implements $ShippingChargeCopyWith<$Res> {
  _$ShippingChargeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? freeShippingAfter = freezed,
    Object? shippingCost = freezed,
  }) {
    return _then(_value.copyWith(
      freeShippingAfter: freezed == freeShippingAfter
          ? _value.freeShippingAfter
          : freeShippingAfter // ignore: cast_nullable_to_non_nullable
              as double?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShippingChargeImplCopyWith<$Res>
    implements $ShippingChargeCopyWith<$Res> {
  factory _$$ShippingChargeImplCopyWith(_$ShippingChargeImpl value,
          $Res Function(_$ShippingChargeImpl) then) =
      __$$ShippingChargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'free_shipping_after') double? freeShippingAfter,
      @JsonKey(name: 'shipping_cost') double? shippingCost});
}

/// @nodoc
class __$$ShippingChargeImplCopyWithImpl<$Res>
    extends _$ShippingChargeCopyWithImpl<$Res, _$ShippingChargeImpl>
    implements _$$ShippingChargeImplCopyWith<$Res> {
  __$$ShippingChargeImplCopyWithImpl(
      _$ShippingChargeImpl _value, $Res Function(_$ShippingChargeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? freeShippingAfter = freezed,
    Object? shippingCost = freezed,
  }) {
    return _then(_$ShippingChargeImpl(
      freeShippingAfter: freezed == freeShippingAfter
          ? _value.freeShippingAfter
          : freeShippingAfter // ignore: cast_nullable_to_non_nullable
              as double?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShippingChargeImpl implements _ShippingCharge {
  const _$ShippingChargeImpl(
      {@JsonKey(name: 'free_shipping_after') this.freeShippingAfter,
      @JsonKey(name: 'shipping_cost') this.shippingCost});

  factory _$ShippingChargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingChargeImplFromJson(json);

  @override
  @JsonKey(name: 'free_shipping_after')
  final double? freeShippingAfter;
  @override
  @JsonKey(name: 'shipping_cost')
  final double? shippingCost;

  @override
  String toString() {
    return 'ShippingCharge(freeShippingAfter: $freeShippingAfter, shippingCost: $shippingCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingChargeImpl &&
            (identical(other.freeShippingAfter, freeShippingAfter) ||
                other.freeShippingAfter == freeShippingAfter) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, freeShippingAfter, shippingCost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingChargeImplCopyWith<_$ShippingChargeImpl> get copyWith =>
      __$$ShippingChargeImplCopyWithImpl<_$ShippingChargeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingChargeImplToJson(
      this,
    );
  }
}

abstract class _ShippingCharge implements ShippingCharge {
  const factory _ShippingCharge(
      {@JsonKey(name: 'free_shipping_after') final double? freeShippingAfter,
      @JsonKey(name: 'shipping_cost')
      final double? shippingCost}) = _$ShippingChargeImpl;

  factory _ShippingCharge.fromJson(Map<String, dynamic> json) =
      _$ShippingChargeImpl.fromJson;

  @override
  @JsonKey(name: 'free_shipping_after')
  double? get freeShippingAfter;
  @override
  @JsonKey(name: 'shipping_cost')
  double? get shippingCost;
  @override
  @JsonKey(ignore: true)
  _$$ShippingChargeImplCopyWith<_$ShippingChargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
