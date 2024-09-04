// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) {
  return _OrderInfo.fromJson(json);
}

/// @nodoc
mixin _$OrderInfo {
  List<OrderItem> get orderItem => throw _privateConstructorUsedError;
  RemoteOrder get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderInfoCopyWith<OrderInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderInfoCopyWith<$Res> {
  factory $OrderInfoCopyWith(OrderInfo value, $Res Function(OrderInfo) then) =
      _$OrderInfoCopyWithImpl<$Res, OrderInfo>;
  @useResult
  $Res call({List<OrderItem> orderItem, RemoteOrder order});

  $RemoteOrderCopyWith<$Res> get order;
}

/// @nodoc
class _$OrderInfoCopyWithImpl<$Res, $Val extends OrderInfo>
    implements $OrderInfoCopyWith<$Res> {
  _$OrderInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderItem = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      orderItem: null == orderItem
          ? _value.orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as RemoteOrder,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RemoteOrderCopyWith<$Res> get order {
    return $RemoteOrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderInfoImplCopyWith<$Res>
    implements $OrderInfoCopyWith<$Res> {
  factory _$$OrderInfoImplCopyWith(
          _$OrderInfoImpl value, $Res Function(_$OrderInfoImpl) then) =
      __$$OrderInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OrderItem> orderItem, RemoteOrder order});

  @override
  $RemoteOrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$OrderInfoImplCopyWithImpl<$Res>
    extends _$OrderInfoCopyWithImpl<$Res, _$OrderInfoImpl>
    implements _$$OrderInfoImplCopyWith<$Res> {
  __$$OrderInfoImplCopyWithImpl(
      _$OrderInfoImpl _value, $Res Function(_$OrderInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderItem = null,
    Object? order = null,
  }) {
    return _then(_$OrderInfoImpl(
      orderItem: null == orderItem
          ? _value._orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as RemoteOrder,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrderInfoImpl implements _OrderInfo {
  const _$OrderInfoImpl(
      {required final List<OrderItem> orderItem, required this.order})
      : _orderItem = orderItem;

  factory _$OrderInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderInfoImplFromJson(json);

  final List<OrderItem> _orderItem;
  @override
  List<OrderItem> get orderItem {
    if (_orderItem is EqualUnmodifiableListView) return _orderItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItem);
  }

  @override
  final RemoteOrder order;

  @override
  String toString() {
    return 'OrderInfo(orderItem: $orderItem, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderInfoImpl &&
            const DeepCollectionEquality()
                .equals(other._orderItem, _orderItem) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_orderItem), order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderInfoImplCopyWith<_$OrderInfoImpl> get copyWith =>
      __$$OrderInfoImplCopyWithImpl<_$OrderInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderInfoImplToJson(
      this,
    );
  }
}

abstract class _OrderInfo implements OrderInfo {
  const factory _OrderInfo(
      {required final List<OrderItem> orderItem,
      required final RemoteOrder order}) = _$OrderInfoImpl;

  factory _OrderInfo.fromJson(Map<String, dynamic> json) =
      _$OrderInfoImpl.fromJson;

  @override
  List<OrderItem> get orderItem;
  @override
  RemoteOrder get order;
  @override
  @JsonKey(ignore: true)
  _$$OrderInfoImplCopyWith<_$OrderInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RemoteOrder _$RemoteOrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$RemoteOrder {
  ShippingLocation get shippingLocation => throw _privateConstructorUsedError;
  OrderShippingCharge get shippingCharge => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  VendorHasCustomerId? get vendorHasCustomerId =>
      throw _privateConstructorUsedError;
  List<OrderStatus> get status => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteOrderCopyWith<RemoteOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteOrderCopyWith<$Res> {
  factory $RemoteOrderCopyWith(
          RemoteOrder value, $Res Function(RemoteOrder) then) =
      _$RemoteOrderCopyWithImpl<$Res, RemoteOrder>;
  @useResult
  $Res call(
      {ShippingLocation shippingLocation,
      OrderShippingCharge shippingCharge,
      @JsonKey(name: "_id") String id,
      VendorHasCustomerId? vendorHasCustomerId,
      List<OrderStatus> status,
      int total,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  $ShippingLocationCopyWith<$Res> get shippingLocation;
  $OrderShippingChargeCopyWith<$Res> get shippingCharge;
  $VendorHasCustomerIdCopyWith<$Res>? get vendorHasCustomerId;
}

/// @nodoc
class _$RemoteOrderCopyWithImpl<$Res, $Val extends RemoteOrder>
    implements $RemoteOrderCopyWith<$Res> {
  _$RemoteOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingLocation = null,
    Object? shippingCharge = null,
    Object? id = null,
    Object? vendorHasCustomerId = freezed,
    Object? status = null,
    Object? total = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      shippingLocation: null == shippingLocation
          ? _value.shippingLocation
          : shippingLocation // ignore: cast_nullable_to_non_nullable
              as ShippingLocation,
      shippingCharge: null == shippingCharge
          ? _value.shippingCharge
          : shippingCharge // ignore: cast_nullable_to_non_nullable
              as OrderShippingCharge,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vendorHasCustomerId: freezed == vendorHasCustomerId
          ? _value.vendorHasCustomerId
          : vendorHasCustomerId // ignore: cast_nullable_to_non_nullable
              as VendorHasCustomerId?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<OrderStatus>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
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
  $ShippingLocationCopyWith<$Res> get shippingLocation {
    return $ShippingLocationCopyWith<$Res>(_value.shippingLocation, (value) {
      return _then(_value.copyWith(shippingLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderShippingChargeCopyWith<$Res> get shippingCharge {
    return $OrderShippingChargeCopyWith<$Res>(_value.shippingCharge, (value) {
      return _then(_value.copyWith(shippingCharge: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VendorHasCustomerIdCopyWith<$Res>? get vendorHasCustomerId {
    if (_value.vendorHasCustomerId == null) {
      return null;
    }

    return $VendorHasCustomerIdCopyWith<$Res>(_value.vendorHasCustomerId!,
        (value) {
      return _then(_value.copyWith(vendorHasCustomerId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res>
    implements $RemoteOrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ShippingLocation shippingLocation,
      OrderShippingCharge shippingCharge,
      @JsonKey(name: "_id") String id,
      VendorHasCustomerId? vendorHasCustomerId,
      List<OrderStatus> status,
      int total,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  @override
  $ShippingLocationCopyWith<$Res> get shippingLocation;
  @override
  $OrderShippingChargeCopyWith<$Res> get shippingCharge;
  @override
  $VendorHasCustomerIdCopyWith<$Res>? get vendorHasCustomerId;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$RemoteOrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingLocation = null,
    Object? shippingCharge = null,
    Object? id = null,
    Object? vendorHasCustomerId = freezed,
    Object? status = null,
    Object? total = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderImpl(
      shippingLocation: null == shippingLocation
          ? _value.shippingLocation
          : shippingLocation // ignore: cast_nullable_to_non_nullable
              as ShippingLocation,
      shippingCharge: null == shippingCharge
          ? _value.shippingCharge
          : shippingCharge // ignore: cast_nullable_to_non_nullable
              as OrderShippingCharge,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vendorHasCustomerId: freezed == vendorHasCustomerId
          ? _value.vendorHasCustomerId
          : vendorHasCustomerId // ignore: cast_nullable_to_non_nullable
              as VendorHasCustomerId?,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<OrderStatus>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
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
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.shippingLocation,
      required this.shippingCharge,
      @JsonKey(name: "_id") required this.id,
      this.vendorHasCustomerId,
      required final List<OrderStatus> status,
      required this.total,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt})
      : _status = status;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final ShippingLocation shippingLocation;
  @override
  final OrderShippingCharge shippingCharge;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final VendorHasCustomerId? vendorHasCustomerId;
  final List<OrderStatus> _status;
  @override
  List<OrderStatus> get status {
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_status);
  }

  @override
  final int total;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RemoteOrder(shippingLocation: $shippingLocation, shippingCharge: $shippingCharge, id: $id, vendorHasCustomerId: $vendorHasCustomerId, status: $status, total: $total, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.shippingLocation, shippingLocation) ||
                other.shippingLocation == shippingLocation) &&
            (identical(other.shippingCharge, shippingCharge) ||
                other.shippingCharge == shippingCharge) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorHasCustomerId, vendorHasCustomerId) ||
                other.vendorHasCustomerId == vendorHasCustomerId) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      shippingLocation,
      shippingCharge,
      id,
      vendorHasCustomerId,
      const DeepCollectionEquality().hash(_status),
      total,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements RemoteOrder {
  const factory _Order(
          {required final ShippingLocation shippingLocation,
          required final OrderShippingCharge shippingCharge,
          @JsonKey(name: "_id") required final String id,
          final VendorHasCustomerId? vendorHasCustomerId,
          required final List<OrderStatus> status,
          required final int total,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "updatedAt") required final DateTime updatedAt}) =
      _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  ShippingLocation get shippingLocation;
  @override
  OrderShippingCharge get shippingCharge;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  VendorHasCustomerId? get vendorHasCustomerId;
  @override
  List<OrderStatus> get status;
  @override
  int get total;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderShippingCharge _$OrderShippingChargeFromJson(Map<String, dynamic> json) {
  return _ShippingCharge.fromJson(json);
}

/// @nodoc
mixin _$OrderShippingCharge {
  String get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderShippingChargeCopyWith<OrderShippingCharge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderShippingChargeCopyWith<$Res> {
  factory $OrderShippingChargeCopyWith(
          OrderShippingCharge value, $Res Function(OrderShippingCharge) then) =
      _$OrderShippingChargeCopyWithImpl<$Res, OrderShippingCharge>;
  @useResult
  $Res call({String type, double amount});
}

/// @nodoc
class _$OrderShippingChargeCopyWithImpl<$Res, $Val extends OrderShippingCharge>
    implements $OrderShippingChargeCopyWith<$Res> {
  _$OrderShippingChargeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShippingChargeImplCopyWith<$Res>
    implements $OrderShippingChargeCopyWith<$Res> {
  factory _$$ShippingChargeImplCopyWith(_$ShippingChargeImpl value,
          $Res Function(_$ShippingChargeImpl) then) =
      __$$ShippingChargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, double amount});
}

/// @nodoc
class __$$ShippingChargeImplCopyWithImpl<$Res>
    extends _$OrderShippingChargeCopyWithImpl<$Res, _$ShippingChargeImpl>
    implements _$$ShippingChargeImplCopyWith<$Res> {
  __$$ShippingChargeImplCopyWithImpl(
      _$ShippingChargeImpl _value, $Res Function(_$ShippingChargeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_$ShippingChargeImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ShippingChargeImpl implements _ShippingCharge {
  const _$ShippingChargeImpl({required this.type, required this.amount});

  factory _$ShippingChargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingChargeImplFromJson(json);

  @override
  final String type;
  @override
  final double amount;

  @override
  String toString() {
    return 'OrderShippingCharge(type: $type, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingChargeImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, amount);

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

abstract class _ShippingCharge implements OrderShippingCharge {
  const factory _ShippingCharge(
      {required final String type,
      required final double amount}) = _$ShippingChargeImpl;

  factory _ShippingCharge.fromJson(Map<String, dynamic> json) =
      _$ShippingChargeImpl.fromJson;

  @override
  String get type;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$ShippingChargeImplCopyWith<_$ShippingChargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShippingLocation _$ShippingLocationFromJson(Map<String, dynamic> json) {
  return _ShippingLocation.fromJson(json);
}

/// @nodoc
mixin _$ShippingLocation {
  String get type => throw _privateConstructorUsedError;
  List<String> get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShippingLocationCopyWith<ShippingLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingLocationCopyWith<$Res> {
  factory $ShippingLocationCopyWith(
          ShippingLocation value, $Res Function(ShippingLocation) then) =
      _$ShippingLocationCopyWithImpl<$Res, ShippingLocation>;
  @useResult
  $Res call(
      {String type,
      List<String> address,
      String city,
      String zipCode,
      String state,
      String country});
}

/// @nodoc
class _$ShippingLocationCopyWithImpl<$Res, $Val extends ShippingLocation>
    implements $ShippingLocationCopyWith<$Res> {
  _$ShippingLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? address = null,
    Object? city = null,
    Object? zipCode = null,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<String>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShippingLocationImplCopyWith<$Res>
    implements $ShippingLocationCopyWith<$Res> {
  factory _$$ShippingLocationImplCopyWith(_$ShippingLocationImpl value,
          $Res Function(_$ShippingLocationImpl) then) =
      __$$ShippingLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      List<String> address,
      String city,
      String zipCode,
      String state,
      String country});
}

/// @nodoc
class __$$ShippingLocationImplCopyWithImpl<$Res>
    extends _$ShippingLocationCopyWithImpl<$Res, _$ShippingLocationImpl>
    implements _$$ShippingLocationImplCopyWith<$Res> {
  __$$ShippingLocationImplCopyWithImpl(_$ShippingLocationImpl _value,
      $Res Function(_$ShippingLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? address = null,
    Object? city = null,
    Object? zipCode = null,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(_$ShippingLocationImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<String>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ShippingLocationImpl implements _ShippingLocation {
  const _$ShippingLocationImpl(
      {required this.type,
      required final List<String> address,
      required this.city,
      required this.zipCode,
      required this.state,
      required this.country})
      : _address = address;

  factory _$ShippingLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingLocationImplFromJson(json);

  @override
  final String type;
  final List<String> _address;
  @override
  List<String> get address {
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_address);
  }

  @override
  final String city;
  @override
  final String zipCode;
  @override
  final String state;
  @override
  final String country;

  @override
  String toString() {
    return 'ShippingLocation(type: $type, address: $address, city: $city, zipCode: $zipCode, state: $state, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingLocationImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_address),
      city,
      zipCode,
      state,
      country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingLocationImplCopyWith<_$ShippingLocationImpl> get copyWith =>
      __$$ShippingLocationImplCopyWithImpl<_$ShippingLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingLocationImplToJson(
      this,
    );
  }
}

abstract class _ShippingLocation implements ShippingLocation {
  const factory _ShippingLocation(
      {required final String type,
      required final List<String> address,
      required final String city,
      required final String zipCode,
      required final String state,
      required final String country}) = _$ShippingLocationImpl;

  factory _ShippingLocation.fromJson(Map<String, dynamic> json) =
      _$ShippingLocationImpl.fromJson;

  @override
  String get type;
  @override
  List<String> get address;
  @override
  String get city;
  @override
  String get zipCode;
  @override
  String get state;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$ShippingLocationImplCopyWith<_$ShippingLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$OrderStatus {
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusCopyWith<OrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusCopyWith<$Res> {
  factory $OrderStatusCopyWith(
          OrderStatus value, $Res Function(OrderStatus) then) =
      _$OrderStatusCopyWithImpl<$Res, OrderStatus>;
  @useResult
  $Res call(
      {String type,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$OrderStatusCopyWithImpl<$Res, $Val extends OrderStatus>
    implements $OrderStatusCopyWith<$Res> {
  _$OrderStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res>
    implements $OrderStatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(
          _$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(
      _$StatusImpl _value, $Res Function(_$StatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
  }) {
    return _then(_$StatusImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$StatusImpl implements _Status {
  const _$StatusImpl(
      {required this.type,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt,
      @JsonKey(name: "_id") required this.id});

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;
  @override
  @JsonKey(name: "_id")
  final String id;

  @override
  String toString() {
    return 'OrderStatus(type: $type, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, createdAt, updatedAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusImplToJson(
      this,
    );
  }
}

abstract class _Status implements OrderStatus {
  const factory _Status(
      {required final String type,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "updatedAt") required final DateTime updatedAt,
      @JsonKey(name: "_id") required final String id}) = _$StatusImpl;

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override
  String get type;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorHasCustomerId _$VendorHasCustomerIdFromJson(Map<String, dynamic> json) {
  return _VendorHasCustomerId.fromJson(json);
}

/// @nodoc
mixin _$VendorHasCustomerId {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  CustomerId get customerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorHasCustomerIdCopyWith<VendorHasCustomerId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorHasCustomerIdCopyWith<$Res> {
  factory $VendorHasCustomerIdCopyWith(
          VendorHasCustomerId value, $Res Function(VendorHasCustomerId) then) =
      _$VendorHasCustomerIdCopyWithImpl<$Res, VendorHasCustomerId>;
  @useResult
  $Res call({@JsonKey(name: "_id") String id, CustomerId customerId});

  $CustomerIdCopyWith<$Res> get customerId;
}

/// @nodoc
class _$VendorHasCustomerIdCopyWithImpl<$Res, $Val extends VendorHasCustomerId>
    implements $VendorHasCustomerIdCopyWith<$Res> {
  _$VendorHasCustomerIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as CustomerId,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerIdCopyWith<$Res> get customerId {
    return $CustomerIdCopyWith<$Res>(_value.customerId, (value) {
      return _then(_value.copyWith(customerId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VendorHasCustomerIdImplCopyWith<$Res>
    implements $VendorHasCustomerIdCopyWith<$Res> {
  factory _$$VendorHasCustomerIdImplCopyWith(_$VendorHasCustomerIdImpl value,
          $Res Function(_$VendorHasCustomerIdImpl) then) =
      __$$VendorHasCustomerIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String id, CustomerId customerId});

  @override
  $CustomerIdCopyWith<$Res> get customerId;
}

/// @nodoc
class __$$VendorHasCustomerIdImplCopyWithImpl<$Res>
    extends _$VendorHasCustomerIdCopyWithImpl<$Res, _$VendorHasCustomerIdImpl>
    implements _$$VendorHasCustomerIdImplCopyWith<$Res> {
  __$$VendorHasCustomerIdImplCopyWithImpl(_$VendorHasCustomerIdImpl _value,
      $Res Function(_$VendorHasCustomerIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
  }) {
    return _then(_$VendorHasCustomerIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as CustomerId,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$VendorHasCustomerIdImpl implements _VendorHasCustomerId {
  const _$VendorHasCustomerIdImpl(
      {@JsonKey(name: "_id") required this.id, required this.customerId});

  factory _$VendorHasCustomerIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorHasCustomerIdImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final CustomerId customerId;

  @override
  String toString() {
    return 'VendorHasCustomerId(id: $id, customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorHasCustomerIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, customerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorHasCustomerIdImplCopyWith<_$VendorHasCustomerIdImpl> get copyWith =>
      __$$VendorHasCustomerIdImplCopyWithImpl<_$VendorHasCustomerIdImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorHasCustomerIdImplToJson(
      this,
    );
  }
}

abstract class _VendorHasCustomerId implements VendorHasCustomerId {
  const factory _VendorHasCustomerId(
      {@JsonKey(name: "_id") required final String id,
      required final CustomerId customerId}) = _$VendorHasCustomerIdImpl;

  factory _VendorHasCustomerId.fromJson(Map<String, dynamic> json) =
      _$VendorHasCustomerIdImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  CustomerId get customerId;
  @override
  @JsonKey(ignore: true)
  _$$VendorHasCustomerIdImplCopyWith<_$VendorHasCustomerIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerId _$CustomerIdFromJson(Map<String, dynamic> json) {
  return _CustomerId.fromJson(json);
}

/// @nodoc
mixin _$CustomerId {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  ProfileId get profileId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerIdCopyWith<CustomerId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerIdCopyWith<$Res> {
  factory $CustomerIdCopyWith(
          CustomerId value, $Res Function(CustomerId) then) =
      _$CustomerIdCopyWithImpl<$Res, CustomerId>;
  @useResult
  $Res call({@JsonKey(name: "_id") String id, ProfileId profileId});

  $ProfileIdCopyWith<$Res> get profileId;
}

/// @nodoc
class _$CustomerIdCopyWithImpl<$Res, $Val extends CustomerId>
    implements $CustomerIdCopyWith<$Res> {
  _$CustomerIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as ProfileId,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileIdCopyWith<$Res> get profileId {
    return $ProfileIdCopyWith<$Res>(_value.profileId, (value) {
      return _then(_value.copyWith(profileId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerIdImplCopyWith<$Res>
    implements $CustomerIdCopyWith<$Res> {
  factory _$$CustomerIdImplCopyWith(
          _$CustomerIdImpl value, $Res Function(_$CustomerIdImpl) then) =
      __$$CustomerIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String id, ProfileId profileId});

  @override
  $ProfileIdCopyWith<$Res> get profileId;
}

/// @nodoc
class __$$CustomerIdImplCopyWithImpl<$Res>
    extends _$CustomerIdCopyWithImpl<$Res, _$CustomerIdImpl>
    implements _$$CustomerIdImplCopyWith<$Res> {
  __$$CustomerIdImplCopyWithImpl(
      _$CustomerIdImpl _value, $Res Function(_$CustomerIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
  }) {
    return _then(_$CustomerIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as ProfileId,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CustomerIdImpl implements _CustomerId {
  const _$CustomerIdImpl(
      {@JsonKey(name: "_id") required this.id, required this.profileId});

  factory _$CustomerIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerIdImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final ProfileId profileId;

  @override
  String toString() {
    return 'CustomerId(id: $id, profileId: $profileId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, profileId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerIdImplCopyWith<_$CustomerIdImpl> get copyWith =>
      __$$CustomerIdImplCopyWithImpl<_$CustomerIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerIdImplToJson(
      this,
    );
  }
}

abstract class _CustomerId implements CustomerId {
  const factory _CustomerId(
      {@JsonKey(name: "_id") required final String id,
      required final ProfileId profileId}) = _$CustomerIdImpl;

  factory _CustomerId.fromJson(Map<String, dynamic> json) =
      _$CustomerIdImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  ProfileId get profileId;
  @override
  @JsonKey(ignore: true)
  _$$CustomerIdImplCopyWith<_$CustomerIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileId _$ProfileIdFromJson(Map<String, dynamic> json) {
  return _ProfileId.fromJson(json);
}

/// @nodoc
mixin _$ProfileId {
  Name get name => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  int get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileIdCopyWith<ProfileId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileIdCopyWith<$Res> {
  factory $ProfileIdCopyWith(ProfileId value, $Res Function(ProfileId) then) =
      _$ProfileIdCopyWithImpl<$Res, ProfileId>;
  @useResult
  $Res call({Name name, @JsonKey(name: "_id") String id, int phone});

  $NameCopyWith<$Res> get name;
}

/// @nodoc
class _$ProfileIdCopyWithImpl<$Res, $Val extends ProfileId>
    implements $ProfileIdCopyWith<$Res> {
  _$ProfileIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NameCopyWith<$Res> get name {
    return $NameCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileIdImplCopyWith<$Res>
    implements $ProfileIdCopyWith<$Res> {
  factory _$$ProfileIdImplCopyWith(
          _$ProfileIdImpl value, $Res Function(_$ProfileIdImpl) then) =
      __$$ProfileIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Name name, @JsonKey(name: "_id") String id, int phone});

  @override
  $NameCopyWith<$Res> get name;
}

/// @nodoc
class __$$ProfileIdImplCopyWithImpl<$Res>
    extends _$ProfileIdCopyWithImpl<$Res, _$ProfileIdImpl>
    implements _$$ProfileIdImplCopyWith<$Res> {
  __$$ProfileIdImplCopyWithImpl(
      _$ProfileIdImpl _value, $Res Function(_$ProfileIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? phone = null,
  }) {
    return _then(_$ProfileIdImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProfileIdImpl implements _ProfileId {
  const _$ProfileIdImpl(
      {required this.name,
      @JsonKey(name: "_id") required this.id,
      required this.phone});

  factory _$ProfileIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileIdImplFromJson(json);

  @override
  final Name name;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final int phone;

  @override
  String toString() {
    return 'ProfileId(name: $name, id: $id, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileIdImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileIdImplCopyWith<_$ProfileIdImpl> get copyWith =>
      __$$ProfileIdImplCopyWithImpl<_$ProfileIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileIdImplToJson(
      this,
    );
  }
}

abstract class _ProfileId implements ProfileId {
  const factory _ProfileId(
      {required final Name name,
      @JsonKey(name: "_id") required final String id,
      required final int phone}) = _$ProfileIdImpl;

  factory _ProfileId.fromJson(Map<String, dynamic> json) =
      _$ProfileIdImpl.fromJson;

  @override
  Name get name;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  int get phone;
  @override
  @JsonKey(ignore: true)
  _$$ProfileIdImplCopyWith<_$ProfileIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Name _$NameFromJson(Map<String, dynamic> json) {
  return _Name.fromJson(json);
}

/// @nodoc
mixin _$Name {
  String? get first => throw _privateConstructorUsedError;
  String? get last => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameCopyWith<Name> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameCopyWith<$Res> {
  factory $NameCopyWith(Name value, $Res Function(Name) then) =
      _$NameCopyWithImpl<$Res, Name>;
  @useResult
  $Res call({String? first, String? last});
}

/// @nodoc
class _$NameCopyWithImpl<$Res, $Val extends Name>
    implements $NameCopyWith<$Res> {
  _$NameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
  }) {
    return _then(_value.copyWith(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NameImplCopyWith<$Res> implements $NameCopyWith<$Res> {
  factory _$$NameImplCopyWith(
          _$NameImpl value, $Res Function(_$NameImpl) then) =
      __$$NameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? first, String? last});
}

/// @nodoc
class __$$NameImplCopyWithImpl<$Res>
    extends _$NameCopyWithImpl<$Res, _$NameImpl>
    implements _$$NameImplCopyWith<$Res> {
  __$$NameImplCopyWithImpl(_$NameImpl _value, $Res Function(_$NameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
  }) {
    return _then(_$NameImpl(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NameImpl implements _Name {
  const _$NameImpl({this.first, this.last});

  factory _$NameImpl.fromJson(Map<String, dynamic> json) =>
      _$$NameImplFromJson(json);

  @override
  final String? first;
  @override
  final String? last;

  @override
  String toString() {
    return 'Name(first: $first, last: $last)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, first, last);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameImplCopyWith<_$NameImpl> get copyWith =>
      __$$NameImplCopyWithImpl<_$NameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NameImplToJson(
      this,
    );
  }
}

abstract class _Name implements Name {
  const factory _Name({final String? first, final String? last}) = _$NameImpl;

  factory _Name.fromJson(Map<String, dynamic> json) = _$NameImpl.fromJson;

  @override
  String? get first;
  @override
  String? get last;
  @override
  @JsonKey(ignore: true)
  _$$NameImplCopyWith<_$NameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  OrderProduct get product => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {OrderProduct product,
      @JsonKey(name: "_id") String id,
      String orderId,
      int quantity,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  $OrderProductCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

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
              as String,
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
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderProduct product,
      @JsonKey(name: "_id") String id,
      String orderId,
      int quantity,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  @override
  $OrderProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
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
    return _then(_$OrderItemImpl(
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
              as String,
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
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.product,
      @JsonKey(name: "_id") required this.id,
      required this.orderId,
      required this.quantity,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt});

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final OrderProduct product;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String orderId;
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
    return 'OrderItem(product: $product, id: $id, orderId: $orderId, quantity: $quantity, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
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
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
          {required final OrderProduct product,
          @JsonKey(name: "_id") required final String id,
          required final String orderId,
          required final int quantity,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "updatedAt") required final DateTime updatedAt}) =
      _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  OrderProduct get product;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get orderId;
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
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$OrderProduct {
  String get productId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int get salesPrice => throw _privateConstructorUsedError;
  int get mrp => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get featuredImg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderProductCopyWith<OrderProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductCopyWith<$Res> {
  factory $OrderProductCopyWith(
          OrderProduct value, $Res Function(OrderProduct) then) =
      _$OrderProductCopyWithImpl<$Res, OrderProduct>;
  @useResult
  $Res call(
      {String productId,
      String title,
      String url,
      int salesPrice,
      int mrp,
      String desc,
      String featuredImg});
}

/// @nodoc
class _$OrderProductCopyWithImpl<$Res, $Val extends OrderProduct>
    implements $OrderProductCopyWith<$Res> {
  _$OrderProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? title = null,
    Object? url = null,
    Object? salesPrice = null,
    Object? mrp = null,
    Object? desc = null,
    Object? featuredImg = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      salesPrice: null == salesPrice
          ? _value.salesPrice
          : salesPrice // ignore: cast_nullable_to_non_nullable
              as int,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as int,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      featuredImg: null == featuredImg
          ? _value.featuredImg
          : featuredImg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res>
    implements $OrderProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String title,
      String url,
      int salesPrice,
      int mrp,
      String desc,
      String featuredImg});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$OrderProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? title = null,
    Object? url = null,
    Object? salesPrice = null,
    Object? mrp = null,
    Object? desc = null,
    Object? featuredImg = null,
  }) {
    return _then(_$ProductImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      salesPrice: null == salesPrice
          ? _value.salesPrice
          : salesPrice // ignore: cast_nullable_to_non_nullable
              as int,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as int,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      featuredImg: null == featuredImg
          ? _value.featuredImg
          : featuredImg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {required this.productId,
      required this.title,
      required this.url,
      required this.salesPrice,
      required this.mrp,
      required this.desc,
      required this.featuredImg});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String productId;
  @override
  final String title;
  @override
  final String url;
  @override
  final int salesPrice;
  @override
  final int mrp;
  @override
  final String desc;
  @override
  final String featuredImg;

  @override
  String toString() {
    return 'OrderProduct(productId: $productId, title: $title, url: $url, salesPrice: $salesPrice, mrp: $mrp, desc: $desc, featuredImg: $featuredImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.salesPrice, salesPrice) ||
                other.salesPrice == salesPrice) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.featuredImg, featuredImg) ||
                other.featuredImg == featuredImg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, title, url, salesPrice, mrp, desc, featuredImg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements OrderProduct {
  const factory _Product(
      {required final String productId,
      required final String title,
      required final String url,
      required final int salesPrice,
      required final int mrp,
      required final String desc,
      required final String featuredImg}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get productId;
  @override
  String get title;
  @override
  String get url;
  @override
  int get salesPrice;
  @override
  int get mrp;
  @override
  String get desc;
  @override
  String get featuredImg;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
