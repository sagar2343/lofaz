// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductUnit _$ProductUnitFromJson(Map<String, dynamic> json) {
  return _ProductUnit.fromJson(json);
}

/// @nodoc
mixin _$ProductUnit {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductUnitCopyWith<ProductUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductUnitCopyWith<$Res> {
  factory $ProductUnitCopyWith(
          ProductUnit value, $Res Function(ProductUnit) then) =
      _$ProductUnitCopyWithImpl<$Res, ProductUnit>;
  @useResult
  $Res call({@JsonKey(name: "_id") String id, String unit});
}

/// @nodoc
class _$ProductUnitCopyWithImpl<$Res, $Val extends ProductUnit>
    implements $ProductUnitCopyWith<$Res> {
  _$ProductUnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductUnitImplCopyWith<$Res>
    implements $ProductUnitCopyWith<$Res> {
  factory _$$ProductUnitImplCopyWith(
          _$ProductUnitImpl value, $Res Function(_$ProductUnitImpl) then) =
      __$$ProductUnitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String id, String unit});
}

/// @nodoc
class __$$ProductUnitImplCopyWithImpl<$Res>
    extends _$ProductUnitCopyWithImpl<$Res, _$ProductUnitImpl>
    implements _$$ProductUnitImplCopyWith<$Res> {
  __$$ProductUnitImplCopyWithImpl(
      _$ProductUnitImpl _value, $Res Function(_$ProductUnitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unit = null,
  }) {
    return _then(_$ProductUnitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductUnitImpl implements _ProductUnit {
  const _$ProductUnitImpl(
      {@JsonKey(name: "_id") required this.id, required this.unit});

  factory _$ProductUnitImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductUnitImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String unit;

  @override
  String toString() {
    return 'ProductUnit(id: $id, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductUnitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductUnitImplCopyWith<_$ProductUnitImpl> get copyWith =>
      __$$ProductUnitImplCopyWithImpl<_$ProductUnitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductUnitImplToJson(
      this,
    );
  }
}

abstract class _ProductUnit implements ProductUnit {
  const factory _ProductUnit(
      {@JsonKey(name: "_id") required final String id,
      required final String unit}) = _$ProductUnitImpl;

  factory _ProductUnit.fromJson(Map<String, dynamic> json) =
      _$ProductUnitImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$ProductUnitImplCopyWith<_$ProductUnitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
