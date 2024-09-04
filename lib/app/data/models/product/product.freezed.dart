// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) {
  return _ProductsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductsResponse {
  @JsonKey(defaultValue: [])
  List<Product> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsResponseCopyWith<ProductsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsResponseCopyWith<$Res> {
  factory $ProductsResponseCopyWith(
          ProductsResponse value, $Res Function(ProductsResponse) then) =
      _$ProductsResponseCopyWithImpl<$Res, ProductsResponse>;
  @useResult
  $Res call({@JsonKey(defaultValue: []) List<Product> data, int total});
}

/// @nodoc
class _$ProductsResponseCopyWithImpl<$Res, $Val extends ProductsResponse>
    implements $ProductsResponseCopyWith<$Res> {
  _$ProductsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsResponseImplCopyWith<$Res>
    implements $ProductsResponseCopyWith<$Res> {
  factory _$$ProductsResponseImplCopyWith(_$ProductsResponseImpl value,
          $Res Function(_$ProductsResponseImpl) then) =
      __$$ProductsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(defaultValue: []) List<Product> data, int total});
}

/// @nodoc
class __$$ProductsResponseImplCopyWithImpl<$Res>
    extends _$ProductsResponseCopyWithImpl<$Res, _$ProductsResponseImpl>
    implements _$$ProductsResponseImplCopyWith<$Res> {
  __$$ProductsResponseImplCopyWithImpl(_$ProductsResponseImpl _value,
      $Res Function(_$ProductsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
  }) {
    return _then(_$ProductsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsResponseImpl implements _ProductsResponse {
  const _$ProductsResponseImpl(
      {@JsonKey(defaultValue: []) required final List<Product> data,
      required this.total})
      : _data = data;

  factory _$ProductsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsResponseImplFromJson(json);

  final List<Product> _data;
  @override
  @JsonKey(defaultValue: [])
  List<Product> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;

  @override
  String toString() {
    return 'ProductsResponse(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsResponseImplCopyWith<_$ProductsResponseImpl> get copyWith =>
      __$$ProductsResponseImplCopyWithImpl<_$ProductsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductsResponse implements ProductsResponse {
  const factory _ProductsResponse(
      {@JsonKey(defaultValue: []) required final List<Product> data,
      required final int total}) = _$ProductsResponseImpl;

  factory _ProductsResponse.fromJson(Map<String, dynamic> json) =
      _$ProductsResponseImpl.fromJson;

  @override
  @JsonKey(defaultValue: [])
  List<Product> get data;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$ProductsResponseImplCopyWith<_$ProductsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  double get salesPrice => throw _privateConstructorUsedError;
  double get mrp => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String? get featuredImg => throw _privateConstructorUsedError;
  List<PhotoModel?> get photo => throw _privateConstructorUsedError;
  String? get trends => throw _privateConstructorUsedError;
  double get unitCount => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  Catalog get category => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool? get catStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String title,
      String url,
      double salesPrice,
      double mrp,
      String desc,
      String? featuredImg,
      List<PhotoModel?> photo,
      String? trends,
      double unitCount,
      String unit,
      String userId,
      bool status,
      int views,
      Catalog category,
      int? stock,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      bool? catStatus});

  $CatalogCopyWith<$Res> get category;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? salesPrice = null,
    Object? mrp = null,
    Object? desc = null,
    Object? featuredImg = freezed,
    Object? photo = null,
    Object? trends = freezed,
    Object? unitCount = null,
    Object? unit = null,
    Object? userId = null,
    Object? status = null,
    Object? views = null,
    Object? category = null,
    Object? stock = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? catStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as double,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      featuredImg: freezed == featuredImg
          ? _value.featuredImg
          : featuredImg // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel?>,
      trends: freezed == trends
          ? _value.trends
          : trends // ignore: cast_nullable_to_non_nullable
              as String?,
      unitCount: null == unitCount
          ? _value.unitCount
          : unitCount // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Catalog,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      catStatus: freezed == catStatus
          ? _value.catStatus
          : catStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CatalogCopyWith<$Res> get category {
    return $CatalogCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String title,
      String url,
      double salesPrice,
      double mrp,
      String desc,
      String? featuredImg,
      List<PhotoModel?> photo,
      String? trends,
      double unitCount,
      String unit,
      String userId,
      bool status,
      int views,
      Catalog category,
      int? stock,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      bool? catStatus});

  @override
  $CatalogCopyWith<$Res> get category;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? salesPrice = null,
    Object? mrp = null,
    Object? desc = null,
    Object? featuredImg = freezed,
    Object? photo = null,
    Object? trends = freezed,
    Object? unitCount = null,
    Object? unit = null,
    Object? userId = null,
    Object? status = null,
    Object? views = null,
    Object? category = null,
    Object? stock = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? catStatus = freezed,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as double,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      featuredImg: freezed == featuredImg
          ? _value.featuredImg
          : featuredImg // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: null == photo
          ? _value._photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel?>,
      trends: freezed == trends
          ? _value.trends
          : trends // ignore: cast_nullable_to_non_nullable
              as String?,
      unitCount: null == unitCount
          ? _value.unitCount
          : unitCount // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Catalog,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      catStatus: freezed == catStatus
          ? _value.catStatus
          : catStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.title,
      required this.url,
      required this.salesPrice,
      required this.mrp,
      required this.desc,
      this.featuredImg,
      final List<PhotoModel?> photo = const [],
      this.trends,
      required this.unitCount,
      required this.unit,
      required this.userId,
      required this.status,
      required this.views,
      required this.category,
      this.stock,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt,
      this.catStatus})
      : _photo = photo;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String title;
  @override
  final String url;
  @override
  final double salesPrice;
  @override
  final double mrp;
  @override
  final String desc;
  @override
  final String? featuredImg;
  final List<PhotoModel?> _photo;
  @override
  @JsonKey()
  List<PhotoModel?> get photo {
    if (_photo is EqualUnmodifiableListView) return _photo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photo);
  }

  @override
  final String? trends;
  @override
  final double unitCount;
  @override
  final String unit;
  @override
  final String userId;
  @override
  final bool status;
  @override
  final int views;
  @override
  final Catalog category;
  @override
  final int? stock;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;
  @override
  final bool? catStatus;

  @override
  String toString() {
    return 'Product(id: $id, title: $title, url: $url, salesPrice: $salesPrice, mrp: $mrp, desc: $desc, featuredImg: $featuredImg, photo: $photo, trends: $trends, unitCount: $unitCount, unit: $unit, userId: $userId, status: $status, views: $views, category: $category, stock: $stock, createdAt: $createdAt, updatedAt: $updatedAt, catStatus: $catStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.salesPrice, salesPrice) ||
                other.salesPrice == salesPrice) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.featuredImg, featuredImg) ||
                other.featuredImg == featuredImg) &&
            const DeepCollectionEquality().equals(other._photo, _photo) &&
            (identical(other.trends, trends) || other.trends == trends) &&
            (identical(other.unitCount, unitCount) ||
                other.unitCount == unitCount) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.catStatus, catStatus) ||
                other.catStatus == catStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        url,
        salesPrice,
        mrp,
        desc,
        featuredImg,
        const DeepCollectionEquality().hash(_photo),
        trends,
        unitCount,
        unit,
        userId,
        status,
        views,
        category,
        stock,
        createdAt,
        updatedAt,
        catStatus
      ]);

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

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: "_id") required final String id,
      required final String title,
      required final String url,
      required final double salesPrice,
      required final double mrp,
      required final String desc,
      final String? featuredImg,
      final List<PhotoModel?> photo,
      final String? trends,
      required final double unitCount,
      required final String unit,
      required final String userId,
      required final bool status,
      required final int views,
      required final Catalog category,
      final int? stock,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "updatedAt") required final DateTime updatedAt,
      final bool? catStatus}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get title;
  @override
  String get url;
  @override
  double get salesPrice;
  @override
  double get mrp;
  @override
  String get desc;
  @override
  String? get featuredImg;
  @override
  List<PhotoModel?> get photo;
  @override
  String? get trends;
  @override
  double get unitCount;
  @override
  String get unit;
  @override
  String get userId;
  @override
  bool get status;
  @override
  int get views;
  @override
  Catalog get category;
  @override
  int? get stock;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;
  @override
  bool? get catStatus;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return _Photo.fromJson(json);
}

/// @nodoc
mixin _$PhotoModel {
  String get location => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  dynamic get eTag => throw _privateConstructorUsedError;
  String? get serverSideEncryption => throw _privateConstructorUsedError;
  String get bucket => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoModelCopyWith<PhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoModelCopyWith<$Res> {
  factory $PhotoModelCopyWith(
          PhotoModel value, $Res Function(PhotoModel) then) =
      _$PhotoModelCopyWithImpl<$Res, PhotoModel>;
  @useResult
  $Res call(
      {String location,
      String? key,
      dynamic eTag,
      String? serverSideEncryption,
      String bucket,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$PhotoModelCopyWithImpl<$Res, $Val extends PhotoModel>
    implements $PhotoModelCopyWith<$Res> {
  _$PhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? key = freezed,
    Object? eTag = freezed,
    Object? serverSideEncryption = freezed,
    Object? bucket = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      eTag: freezed == eTag
          ? _value.eTag
          : eTag // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serverSideEncryption: freezed == serverSideEncryption
          ? _value.serverSideEncryption
          : serverSideEncryption // ignore: cast_nullable_to_non_nullable
              as String?,
      bucket: null == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoImplCopyWith<$Res> implements $PhotoModelCopyWith<$Res> {
  factory _$$PhotoImplCopyWith(
          _$PhotoImpl value, $Res Function(_$PhotoImpl) then) =
      __$$PhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String location,
      String? key,
      dynamic eTag,
      String? serverSideEncryption,
      String bucket,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$$PhotoImplCopyWithImpl<$Res>
    extends _$PhotoModelCopyWithImpl<$Res, _$PhotoImpl>
    implements _$$PhotoImplCopyWith<$Res> {
  __$$PhotoImplCopyWithImpl(
      _$PhotoImpl _value, $Res Function(_$PhotoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? key = freezed,
    Object? eTag = freezed,
    Object? serverSideEncryption = freezed,
    Object? bucket = null,
    Object? id = null,
  }) {
    return _then(_$PhotoImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      eTag: freezed == eTag
          ? _value.eTag
          : eTag // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serverSideEncryption: freezed == serverSideEncryption
          ? _value.serverSideEncryption
          : serverSideEncryption // ignore: cast_nullable_to_non_nullable
              as String?,
      bucket: null == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoImpl implements _Photo {
  const _$PhotoImpl(
      {required this.location,
      required this.key,
      this.eTag,
      required this.serverSideEncryption,
      this.bucket = "",
      @JsonKey(name: "_id") required this.id});

  factory _$PhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoImplFromJson(json);

  @override
  final String location;
  @override
  final String? key;
  @override
  final dynamic eTag;
  @override
  final String? serverSideEncryption;
  @override
  @JsonKey()
  final String bucket;
  @override
  @JsonKey(name: "_id")
  final String id;

  @override
  String toString() {
    return 'PhotoModel(location: $location, key: $key, eTag: $eTag, serverSideEncryption: $serverSideEncryption, bucket: $bucket, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.eTag, eTag) &&
            (identical(other.serverSideEncryption, serverSideEncryption) ||
                other.serverSideEncryption == serverSideEncryption) &&
            (identical(other.bucket, bucket) || other.bucket == bucket) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      key,
      const DeepCollectionEquality().hash(eTag),
      serverSideEncryption,
      bucket,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoImplCopyWith<_$PhotoImpl> get copyWith =>
      __$$PhotoImplCopyWithImpl<_$PhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoImplToJson(
      this,
    );
  }
}

abstract class _Photo implements PhotoModel {
  const factory _Photo(
      {required final String location,
      required final String? key,
      final dynamic eTag,
      required final String? serverSideEncryption,
      final String bucket,
      @JsonKey(name: "_id") required final String id}) = _$PhotoImpl;

  factory _Photo.fromJson(Map<String, dynamic> json) = _$PhotoImpl.fromJson;

  @override
  String get location;
  @override
  String? get key;
  @override
  dynamic get eTag;
  @override
  String? get serverSideEncryption;
  @override
  String get bucket;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$PhotoImplCopyWith<_$PhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
