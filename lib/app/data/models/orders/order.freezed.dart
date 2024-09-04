// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError; // required int orderNo,
  List<OrderProductInfo> get product => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String get custId => throw _privateConstructorUsedError;
  String? get shippingName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intToString)
  String? get shippingPhone =>
      throw _privateConstructorUsedError; // String? userAddressLine1,
// String? userAddressLine2,
// String? userCity,
// String? userState,
// String? userZip,
// String? userCountry,
// @JsonKey(fromJson: intToString) String? userPhone,
  String? get shippingAddress1 => throw _privateConstructorUsedError;
  String? get shippingAddress2 => throw _privateConstructorUsedError;
  String? get shippingCountry => throw _privateConstructorUsedError;
  String? get shippingState => throw _privateConstructorUsedError;
  String? get shippingCity => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intToString)
  String? get shippingZip => throw _privateConstructorUsedError;
  bool get pendingStatus =>
      throw _privateConstructorUsedError; // DateTime? pendingDate,
  bool get acceptStatus =>
      throw _privateConstructorUsedError; // DateTime? acceptDate,
  bool get shippedStatus =>
      throw _privateConstructorUsedError; // DateTime? shippedDate,
  bool get deliverStatus =>
      throw _privateConstructorUsedError; // DateTime? deliverDate,
  bool get cancelStatus =>
      throw _privateConstructorUsedError; // DateTime? cancelDate,
// required String currency,
  String? get note => throw _privateConstructorUsedError;
  OrderShippingCharge? get shippingCharge => throw _privateConstructorUsedError;
  String get grandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // required String cancelledBy,
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<OrderStatus> get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      List<OrderProductInfo> product,
      String? userId,
      String custId,
      String? shippingName,
      @JsonKey(fromJson: intToString) String? shippingPhone,
      String? shippingAddress1,
      String? shippingAddress2,
      String? shippingCountry,
      String? shippingState,
      String? shippingCity,
      @JsonKey(fromJson: intToString) String? shippingZip,
      bool pendingStatus,
      bool acceptStatus,
      bool shippedStatus,
      bool deliverStatus,
      bool cancelStatus,
      String? note,
      OrderShippingCharge? shippingCharge,
      String grandTotal,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      List<OrderStatus> status});

  $OrderShippingChargeCopyWith<$Res>? get shippingCharge;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? userId = freezed,
    Object? custId = null,
    Object? shippingName = freezed,
    Object? shippingPhone = freezed,
    Object? shippingAddress1 = freezed,
    Object? shippingAddress2 = freezed,
    Object? shippingCountry = freezed,
    Object? shippingState = freezed,
    Object? shippingCity = freezed,
    Object? shippingZip = freezed,
    Object? pendingStatus = null,
    Object? acceptStatus = null,
    Object? shippedStatus = null,
    Object? deliverStatus = null,
    Object? cancelStatus = null,
    Object? note = freezed,
    Object? shippingCharge = freezed,
    Object? grandTotal = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<OrderProductInfo>,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      custId: null == custId
          ? _value.custId
          : custId // ignore: cast_nullable_to_non_nullable
              as String,
      shippingName: freezed == shippingName
          ? _value.shippingName
          : shippingName // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPhone: freezed == shippingPhone
          ? _value.shippingPhone
          : shippingPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress1: freezed == shippingAddress1
          ? _value.shippingAddress1
          : shippingAddress1 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress2: freezed == shippingAddress2
          ? _value.shippingAddress2
          : shippingAddress2 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingZip: freezed == shippingZip
          ? _value.shippingZip
          : shippingZip // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingStatus: null == pendingStatus
          ? _value.pendingStatus
          : pendingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptStatus: null == acceptStatus
          ? _value.acceptStatus
          : acceptStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      shippedStatus: null == shippedStatus
          ? _value.shippedStatus
          : shippedStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      deliverStatus: null == deliverStatus
          ? _value.deliverStatus
          : deliverStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      cancelStatus: null == cancelStatus
          ? _value.cancelStatus
          : cancelStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCharge: freezed == shippingCharge
          ? _value.shippingCharge
          : shippingCharge // ignore: cast_nullable_to_non_nullable
              as OrderShippingCharge?,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<OrderStatus>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderShippingChargeCopyWith<$Res>? get shippingCharge {
    if (_value.shippingCharge == null) {
      return null;
    }

    return $OrderShippingChargeCopyWith<$Res>(_value.shippingCharge!, (value) {
      return _then(_value.copyWith(shippingCharge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      List<OrderProductInfo> product,
      String? userId,
      String custId,
      String? shippingName,
      @JsonKey(fromJson: intToString) String? shippingPhone,
      String? shippingAddress1,
      String? shippingAddress2,
      String? shippingCountry,
      String? shippingState,
      String? shippingCity,
      @JsonKey(fromJson: intToString) String? shippingZip,
      bool pendingStatus,
      bool acceptStatus,
      bool shippedStatus,
      bool deliverStatus,
      bool cancelStatus,
      String? note,
      OrderShippingCharge? shippingCharge,
      String grandTotal,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      List<OrderStatus> status});

  @override
  $OrderShippingChargeCopyWith<$Res>? get shippingCharge;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? userId = freezed,
    Object? custId = null,
    Object? shippingName = freezed,
    Object? shippingPhone = freezed,
    Object? shippingAddress1 = freezed,
    Object? shippingAddress2 = freezed,
    Object? shippingCountry = freezed,
    Object? shippingState = freezed,
    Object? shippingCity = freezed,
    Object? shippingZip = freezed,
    Object? pendingStatus = null,
    Object? acceptStatus = null,
    Object? shippedStatus = null,
    Object? deliverStatus = null,
    Object? cancelStatus = null,
    Object? note = freezed,
    Object? shippingCharge = freezed,
    Object? grandTotal = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? status = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<OrderProductInfo>,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      custId: null == custId
          ? _value.custId
          : custId // ignore: cast_nullable_to_non_nullable
              as String,
      shippingName: freezed == shippingName
          ? _value.shippingName
          : shippingName // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPhone: freezed == shippingPhone
          ? _value.shippingPhone
          : shippingPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress1: freezed == shippingAddress1
          ? _value.shippingAddress1
          : shippingAddress1 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress2: freezed == shippingAddress2
          ? _value.shippingAddress2
          : shippingAddress2 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingZip: freezed == shippingZip
          ? _value.shippingZip
          : shippingZip // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingStatus: null == pendingStatus
          ? _value.pendingStatus
          : pendingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptStatus: null == acceptStatus
          ? _value.acceptStatus
          : acceptStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      shippedStatus: null == shippedStatus
          ? _value.shippedStatus
          : shippedStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      deliverStatus: null == deliverStatus
          ? _value.deliverStatus
          : deliverStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      cancelStatus: null == cancelStatus
          ? _value.cancelStatus
          : cancelStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCharge: freezed == shippingCharge
          ? _value.shippingCharge
          : shippingCharge // ignore: cast_nullable_to_non_nullable
              as OrderShippingCharge?,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<OrderStatus>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {@JsonKey(name: "_id") required this.id,
      required final List<OrderProductInfo> product,
      this.userId,
      required this.custId,
      this.shippingName,
      @JsonKey(fromJson: intToString) this.shippingPhone,
      this.shippingAddress1,
      this.shippingAddress2,
      this.shippingCountry,
      this.shippingState,
      this.shippingCity,
      @JsonKey(fromJson: intToString) this.shippingZip,
      this.pendingStatus = false,
      this.acceptStatus = false,
      this.shippedStatus = false,
      this.deliverStatus = false,
      this.cancelStatus = false,
      this.note,
      this.shippingCharge,
      required this.grandTotal,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      required final List<OrderStatus> status})
      : _product = product,
        _status = status;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
// required int orderNo,
  final List<OrderProductInfo> _product;
// required int orderNo,
  @override
  List<OrderProductInfo> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  @override
  final String? userId;
  @override
  final String custId;
  @override
  final String? shippingName;
  @override
  @JsonKey(fromJson: intToString)
  final String? shippingPhone;
// String? userAddressLine1,
// String? userAddressLine2,
// String? userCity,
// String? userState,
// String? userZip,
// String? userCountry,
// @JsonKey(fromJson: intToString) String? userPhone,
  @override
  final String? shippingAddress1;
  @override
  final String? shippingAddress2;
  @override
  final String? shippingCountry;
  @override
  final String? shippingState;
  @override
  final String? shippingCity;
  @override
  @JsonKey(fromJson: intToString)
  final String? shippingZip;
  @override
  @JsonKey()
  final bool pendingStatus;
// DateTime? pendingDate,
  @override
  @JsonKey()
  final bool acceptStatus;
// DateTime? acceptDate,
  @override
  @JsonKey()
  final bool shippedStatus;
// DateTime? shippedDate,
  @override
  @JsonKey()
  final bool deliverStatus;
// DateTime? deliverDate,
  @override
  @JsonKey()
  final bool cancelStatus;
// DateTime? cancelDate,
// required String currency,
  @override
  final String? note;
  @override
  final OrderShippingCharge? shippingCharge;
  @override
  final String grandTotal;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
// required String cancelledBy,
  @override
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  final List<OrderStatus> _status;
  @override
  List<OrderStatus> get status {
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_status);
  }

  @override
  String toString() {
    return 'Order(id: $id, product: $product, userId: $userId, custId: $custId, shippingName: $shippingName, shippingPhone: $shippingPhone, shippingAddress1: $shippingAddress1, shippingAddress2: $shippingAddress2, shippingCountry: $shippingCountry, shippingState: $shippingState, shippingCity: $shippingCity, shippingZip: $shippingZip, pendingStatus: $pendingStatus, acceptStatus: $acceptStatus, shippedStatus: $shippedStatus, deliverStatus: $deliverStatus, cancelStatus: $cancelStatus, note: $note, shippingCharge: $shippingCharge, grandTotal: $grandTotal, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.custId, custId) || other.custId == custId) &&
            (identical(other.shippingName, shippingName) ||
                other.shippingName == shippingName) &&
            (identical(other.shippingPhone, shippingPhone) ||
                other.shippingPhone == shippingPhone) &&
            (identical(other.shippingAddress1, shippingAddress1) ||
                other.shippingAddress1 == shippingAddress1) &&
            (identical(other.shippingAddress2, shippingAddress2) ||
                other.shippingAddress2 == shippingAddress2) &&
            (identical(other.shippingCountry, shippingCountry) ||
                other.shippingCountry == shippingCountry) &&
            (identical(other.shippingState, shippingState) ||
                other.shippingState == shippingState) &&
            (identical(other.shippingCity, shippingCity) ||
                other.shippingCity == shippingCity) &&
            (identical(other.shippingZip, shippingZip) ||
                other.shippingZip == shippingZip) &&
            (identical(other.pendingStatus, pendingStatus) ||
                other.pendingStatus == pendingStatus) &&
            (identical(other.acceptStatus, acceptStatus) ||
                other.acceptStatus == acceptStatus) &&
            (identical(other.shippedStatus, shippedStatus) ||
                other.shippedStatus == shippedStatus) &&
            (identical(other.deliverStatus, deliverStatus) ||
                other.deliverStatus == deliverStatus) &&
            (identical(other.cancelStatus, cancelStatus) ||
                other.cancelStatus == cancelStatus) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.shippingCharge, shippingCharge) ||
                other.shippingCharge == shippingCharge) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._status, _status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_product),
        userId,
        custId,
        shippingName,
        shippingPhone,
        shippingAddress1,
        shippingAddress2,
        shippingCountry,
        shippingState,
        shippingCity,
        shippingZip,
        pendingStatus,
        acceptStatus,
        shippedStatus,
        deliverStatus,
        cancelStatus,
        note,
        shippingCharge,
        grandTotal,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_status)
      ]);

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

abstract class _Order implements Order {
  const factory _Order(
      {@JsonKey(name: "_id") required final String id,
      required final List<OrderProductInfo> product,
      final String? userId,
      required final String custId,
      final String? shippingName,
      @JsonKey(fromJson: intToString) final String? shippingPhone,
      final String? shippingAddress1,
      final String? shippingAddress2,
      final String? shippingCountry,
      final String? shippingState,
      final String? shippingCity,
      @JsonKey(fromJson: intToString) final String? shippingZip,
      final bool pendingStatus,
      final bool acceptStatus,
      final bool shippedStatus,
      final bool deliverStatus,
      final bool cancelStatus,
      final String? note,
      final OrderShippingCharge? shippingCharge,
      required final String grandTotal,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      required final List<OrderStatus> status}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override // required int orderNo,
  List<OrderProductInfo> get product;
  @override
  String? get userId;
  @override
  String get custId;
  @override
  String? get shippingName;
  @override
  @JsonKey(fromJson: intToString)
  String? get shippingPhone;
  @override // String? userAddressLine1,
// String? userAddressLine2,
// String? userCity,
// String? userState,
// String? userZip,
// String? userCountry,
// @JsonKey(fromJson: intToString) String? userPhone,
  String? get shippingAddress1;
  @override
  String? get shippingAddress2;
  @override
  String? get shippingCountry;
  @override
  String? get shippingState;
  @override
  String? get shippingCity;
  @override
  @JsonKey(fromJson: intToString)
  String? get shippingZip;
  @override
  bool get pendingStatus;
  @override // DateTime? pendingDate,
  bool get acceptStatus;
  @override // DateTime? acceptDate,
  bool get shippedStatus;
  @override // DateTime? shippedDate,
  bool get deliverStatus;
  @override // DateTime? deliverDate,
  bool get cancelStatus;
  @override // DateTime? cancelDate,
// required String currency,
  String? get note;
  @override
  OrderShippingCharge? get shippingCharge;
  @override
  String get grandTotal;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override // required String cancelledBy,
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt;
  @override
  List<OrderStatus> get status;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderProductInfo _$OrderProductInfoFromJson(Map<String, dynamic> json) {
  return _OrderProductInfo.fromJson(json);
}

/// @nodoc
mixin _$OrderProductInfo {
  String get prodId => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderProductInfoCopyWith<OrderProductInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductInfoCopyWith<$Res> {
  factory $OrderProductInfoCopyWith(
          OrderProductInfo value, $Res Function(OrderProductInfo) then) =
      _$OrderProductInfoCopyWithImpl<$Res, OrderProductInfo>;
  @useResult
  $Res call(
      {String prodId,
      String? img,
      double price,
      String title,
      double total,
      double qty});
}

/// @nodoc
class _$OrderProductInfoCopyWithImpl<$Res, $Val extends OrderProductInfo>
    implements $OrderProductInfoCopyWith<$Res> {
  _$OrderProductInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prodId = null,
    Object? img = freezed,
    Object? price = null,
    Object? title = null,
    Object? total = null,
    Object? qty = null,
  }) {
    return _then(_value.copyWith(
      prodId: null == prodId
          ? _value.prodId
          : prodId // ignore: cast_nullable_to_non_nullable
              as String,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderProductInfoImplCopyWith<$Res>
    implements $OrderProductInfoCopyWith<$Res> {
  factory _$$OrderProductInfoImplCopyWith(_$OrderProductInfoImpl value,
          $Res Function(_$OrderProductInfoImpl) then) =
      __$$OrderProductInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String prodId,
      String? img,
      double price,
      String title,
      double total,
      double qty});
}

/// @nodoc
class __$$OrderProductInfoImplCopyWithImpl<$Res>
    extends _$OrderProductInfoCopyWithImpl<$Res, _$OrderProductInfoImpl>
    implements _$$OrderProductInfoImplCopyWith<$Res> {
  __$$OrderProductInfoImplCopyWithImpl(_$OrderProductInfoImpl _value,
      $Res Function(_$OrderProductInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prodId = null,
    Object? img = freezed,
    Object? price = null,
    Object? title = null,
    Object? total = null,
    Object? qty = null,
  }) {
    return _then(_$OrderProductInfoImpl(
      prodId: null == prodId
          ? _value.prodId
          : prodId // ignore: cast_nullable_to_non_nullable
              as String,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrderProductInfoImpl implements _OrderProductInfo {
  const _$OrderProductInfoImpl(
      {required this.prodId,
      this.img,
      required this.price,
      required this.title,
      required this.total,
      required this.qty});

  factory _$OrderProductInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderProductInfoImplFromJson(json);

  @override
  final String prodId;
  @override
  final String? img;
  @override
  final double price;
  @override
  final String title;
  @override
  final double total;
  @override
  final double qty;

  @override
  String toString() {
    return 'OrderProductInfo(prodId: $prodId, img: $img, price: $price, title: $title, total: $total, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderProductInfoImpl &&
            (identical(other.prodId, prodId) || other.prodId == prodId) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, prodId, img, price, title, total, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderProductInfoImplCopyWith<_$OrderProductInfoImpl> get copyWith =>
      __$$OrderProductInfoImplCopyWithImpl<_$OrderProductInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderProductInfoImplToJson(
      this,
    );
  }
}

abstract class _OrderProductInfo implements OrderProductInfo {
  const factory _OrderProductInfo(
      {required final String prodId,
      final String? img,
      required final double price,
      required final String title,
      required final double total,
      required final double qty}) = _$OrderProductInfoImpl;

  factory _OrderProductInfo.fromJson(Map<String, dynamic> json) =
      _$OrderProductInfoImpl.fromJson;

  @override
  String get prodId;
  @override
  String? get img;
  @override
  double get price;
  @override
  String get title;
  @override
  double get total;
  @override
  double get qty;
  @override
  @JsonKey(ignore: true)
  _$$OrderProductInfoImplCopyWith<_$OrderProductInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
