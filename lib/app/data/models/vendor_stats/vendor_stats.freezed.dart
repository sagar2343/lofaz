// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VendorStats _$VendorStatsFromJson(Map<String, dynamic> json) {
  return _VendorStats.fromJson(json);
}

/// @nodoc
mixin _$VendorStats {
  @JsonKey(defaultValue: 0)
  int get totalOrder => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get totalCart => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get totalWishlist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorStatsCopyWith<VendorStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorStatsCopyWith<$Res> {
  factory $VendorStatsCopyWith(
          VendorStats value, $Res Function(VendorStats) then) =
      _$VendorStatsCopyWithImpl<$Res, VendorStats>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 0) int totalOrder,
      @JsonKey(defaultValue: 0) int totalAmount,
      @JsonKey(defaultValue: 0) int totalCart,
      @JsonKey(defaultValue: 0) int totalWishlist});
}

/// @nodoc
class _$VendorStatsCopyWithImpl<$Res, $Val extends VendorStats>
    implements $VendorStatsCopyWith<$Res> {
  _$VendorStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrder = null,
    Object? totalAmount = null,
    Object? totalCart = null,
    Object? totalWishlist = null,
  }) {
    return _then(_value.copyWith(
      totalOrder: null == totalOrder
          ? _value.totalOrder
          : totalOrder // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCart: null == totalCart
          ? _value.totalCart
          : totalCart // ignore: cast_nullable_to_non_nullable
              as int,
      totalWishlist: null == totalWishlist
          ? _value.totalWishlist
          : totalWishlist // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorStatsImplCopyWith<$Res>
    implements $VendorStatsCopyWith<$Res> {
  factory _$$VendorStatsImplCopyWith(
          _$VendorStatsImpl value, $Res Function(_$VendorStatsImpl) then) =
      __$$VendorStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 0) int totalOrder,
      @JsonKey(defaultValue: 0) int totalAmount,
      @JsonKey(defaultValue: 0) int totalCart,
      @JsonKey(defaultValue: 0) int totalWishlist});
}

/// @nodoc
class __$$VendorStatsImplCopyWithImpl<$Res>
    extends _$VendorStatsCopyWithImpl<$Res, _$VendorStatsImpl>
    implements _$$VendorStatsImplCopyWith<$Res> {
  __$$VendorStatsImplCopyWithImpl(
      _$VendorStatsImpl _value, $Res Function(_$VendorStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrder = null,
    Object? totalAmount = null,
    Object? totalCart = null,
    Object? totalWishlist = null,
  }) {
    return _then(_$VendorStatsImpl(
      totalOrder: null == totalOrder
          ? _value.totalOrder
          : totalOrder // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCart: null == totalCart
          ? _value.totalCart
          : totalCart // ignore: cast_nullable_to_non_nullable
              as int,
      totalWishlist: null == totalWishlist
          ? _value.totalWishlist
          : totalWishlist // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$VendorStatsImpl extends _VendorStats {
  const _$VendorStatsImpl(
      {@JsonKey(defaultValue: 0) required this.totalOrder,
      @JsonKey(defaultValue: 0) required this.totalAmount,
      @JsonKey(defaultValue: 0) required this.totalCart,
      @JsonKey(defaultValue: 0) required this.totalWishlist})
      : super._();

  factory _$VendorStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorStatsImplFromJson(json);

  @override
  @JsonKey(defaultValue: 0)
  final int totalOrder;
  @override
  @JsonKey(defaultValue: 0)
  final int totalAmount;
  @override
  @JsonKey(defaultValue: 0)
  final int totalCart;
  @override
  @JsonKey(defaultValue: 0)
  final int totalWishlist;

  @override
  String toString() {
    return 'VendorStats(totalOrder: $totalOrder, totalAmount: $totalAmount, totalCart: $totalCart, totalWishlist: $totalWishlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorStatsImpl &&
            (identical(other.totalOrder, totalOrder) ||
                other.totalOrder == totalOrder) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalCart, totalCart) ||
                other.totalCart == totalCart) &&
            (identical(other.totalWishlist, totalWishlist) ||
                other.totalWishlist == totalWishlist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalOrder, totalAmount, totalCart, totalWishlist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorStatsImplCopyWith<_$VendorStatsImpl> get copyWith =>
      __$$VendorStatsImplCopyWithImpl<_$VendorStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorStatsImplToJson(
      this,
    );
  }
}

abstract class _VendorStats extends VendorStats {
  const factory _VendorStats(
          {@JsonKey(defaultValue: 0) required final int totalOrder,
          @JsonKey(defaultValue: 0) required final int totalAmount,
          @JsonKey(defaultValue: 0) required final int totalCart,
          @JsonKey(defaultValue: 0) required final int totalWishlist}) =
      _$VendorStatsImpl;
  const _VendorStats._() : super._();

  factory _VendorStats.fromJson(Map<String, dynamic> json) =
      _$VendorStatsImpl.fromJson;

  @override
  @JsonKey(defaultValue: 0)
  int get totalOrder;
  @override
  @JsonKey(defaultValue: 0)
  int get totalAmount;
  @override
  @JsonKey(defaultValue: 0)
  int get totalCart;
  @override
  @JsonKey(defaultValue: 0)
  int get totalWishlist;
  @override
  @JsonKey(ignore: true)
  _$$VendorStatsImplCopyWith<_$VendorStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
