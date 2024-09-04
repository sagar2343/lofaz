// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SingleProductOrderResponse _$SingleProductOrderResponseFromJson(
    Map<String, dynamic> json) {
  return _SingleOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$SingleProductOrderResponse {
  OrderProduct get product => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  RemoteOrder get orderId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleProductOrderResponseCopyWith<SingleProductOrderResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleProductOrderResponseCopyWith<$Res> {
  factory $SingleProductOrderResponseCopyWith(SingleProductOrderResponse value,
          $Res Function(SingleProductOrderResponse) then) =
      _$SingleProductOrderResponseCopyWithImpl<$Res,
          SingleProductOrderResponse>;
  @useResult
  $Res call(
      {OrderProduct product,
      @JsonKey(name: "_id") String id,
      RemoteOrder orderId,
      int quantity,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  $OrderProductCopyWith<$Res> get product;
  $RemoteOrderCopyWith<$Res> get orderId;
}

/// @nodoc
class _$SingleProductOrderResponseCopyWithImpl<$Res,
        $Val extends SingleProductOrderResponse>
    implements $SingleProductOrderResponseCopyWith<$Res> {
  _$SingleProductOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? id = null,
    Object? orderId = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as OrderProduct,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as RemoteOrder,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderProductCopyWith<$Res> get product {
    return $OrderProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RemoteOrderCopyWith<$Res> get orderId {
    return $RemoteOrderCopyWith<$Res>(_value.orderId, (value) {
      return _then(_value.copyWith(orderId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingleOrderResponseImplCopyWith<$Res>
    implements $SingleProductOrderResponseCopyWith<$Res> {
  factory _$$SingleOrderResponseImplCopyWith(_$SingleOrderResponseImpl value,
          $Res Function(_$SingleOrderResponseImpl) then) =
      __$$SingleOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderProduct product,
      @JsonKey(name: "_id") String id,
      RemoteOrder orderId,
      int quantity,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  @override
  $OrderProductCopyWith<$Res> get product;
  @override
  $RemoteOrderCopyWith<$Res> get orderId;
}

/// @nodoc
class __$$SingleOrderResponseImplCopyWithImpl<$Res>
    extends _$SingleProductOrderResponseCopyWithImpl<$Res,
        _$SingleOrderResponseImpl>
    implements _$$SingleOrderResponseImplCopyWith<$Res> {
  __$$SingleOrderResponseImplCopyWithImpl(_$SingleOrderResponseImpl _value,
      $Res Function(_$SingleOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? id = null,
    Object? orderId = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SingleOrderResponseImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as OrderProduct,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as RemoteOrder,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SingleOrderResponseImpl implements _SingleOrderResponse {
  const _$SingleOrderResponseImpl(
      {required this.product,
      @JsonKey(name: "_id") required this.id,
      required this.orderId,
      required this.quantity,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt});

  factory _$SingleOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleOrderResponseImplFromJson(json);

  @override
  final OrderProduct product;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final RemoteOrder orderId;
  @override
  final int quantity;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SingleProductOrderResponse(product: $product, id: $id, orderId: $orderId, quantity: $quantity, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleOrderResponseImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, product, id, orderId, quantity, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleOrderResponseImplCopyWith<_$SingleOrderResponseImpl> get copyWith =>
      __$$SingleOrderResponseImplCopyWithImpl<_$SingleOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _SingleOrderResponse implements SingleProductOrderResponse {
  const factory _SingleOrderResponse(
          {required final OrderProduct product,
          @JsonKey(name: "_id") required final String id,
          required final RemoteOrder orderId,
          required final int quantity,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "updatedAt") required final DateTime updatedAt}) =
      _$SingleOrderResponseImpl;

  factory _SingleOrderResponse.fromJson(Map<String, dynamic> json) =
      _$SingleOrderResponseImpl.fromJson;

  @override
  OrderProduct get product;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  RemoteOrder get orderId;
  @override
  int get quantity;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SingleOrderResponseImplCopyWith<_$SingleOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
