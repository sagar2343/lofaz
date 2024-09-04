// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopCategory _$ShopCategoryFromJson(Map<String, dynamic> json) {
  return _ShopCategory.fromJson(json);
}

/// @nodoc
mixin _$ShopCategory {
  @JsonKey(name: "_id", defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [], readValue: parseImage)
  List<String> get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopCategoryCopyWith<ShopCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCategoryCopyWith<$Res> {
  factory $ShopCategoryCopyWith(
          ShopCategory value, $Res Function(ShopCategory) then) =
      _$ShopCategoryCopyWithImpl<$Res, ShopCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id", defaultValue: '') String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: [], readValue: parseImage) List<String> image});
}

/// @nodoc
class _$ShopCategoryCopyWithImpl<$Res, $Val extends ShopCategory>
    implements $ShopCategoryCopyWith<$Res> {
  _$ShopCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopCategoryImplCopyWith<$Res>
    implements $ShopCategoryCopyWith<$Res> {
  factory _$$ShopCategoryImplCopyWith(
          _$ShopCategoryImpl value, $Res Function(_$ShopCategoryImpl) then) =
      __$$ShopCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id", defaultValue: '') String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: [], readValue: parseImage) List<String> image});
}

/// @nodoc
class __$$ShopCategoryImplCopyWithImpl<$Res>
    extends _$ShopCategoryCopyWithImpl<$Res, _$ShopCategoryImpl>
    implements _$$ShopCategoryImplCopyWith<$Res> {
  __$$ShopCategoryImplCopyWithImpl(
      _$ShopCategoryImpl _value, $Res Function(_$ShopCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_$ShopCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopCategoryImpl implements _ShopCategory {
  const _$ShopCategoryImpl(
      {@JsonKey(name: "_id", defaultValue: '') required this.id,
      @JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: [], readValue: parseImage)
      required final List<String> image})
      : _image = image;

  factory _$ShopCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopCategoryImplFromJson(json);

  @override
  @JsonKey(name: "_id", defaultValue: '')
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String title;
  final List<String> _image;
  @override
  @JsonKey(defaultValue: [], readValue: parseImage)
  List<String> get image {
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_image);
  }

  @override
  String toString() {
    return 'ShopCategory(id: $id, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._image, _image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopCategoryImplCopyWith<_$ShopCategoryImpl> get copyWith =>
      __$$ShopCategoryImplCopyWithImpl<_$ShopCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopCategoryImplToJson(
      this,
    );
  }
}

abstract class _ShopCategory implements ShopCategory {
  const factory _ShopCategory(
      {@JsonKey(name: "_id", defaultValue: '') required final String id,
      @JsonKey(defaultValue: '') required final String title,
      @JsonKey(defaultValue: [], readValue: parseImage)
      required final List<String> image}) = _$ShopCategoryImpl;

  factory _ShopCategory.fromJson(Map<String, dynamic> json) =
      _$ShopCategoryImpl.fromJson;

  @override
  @JsonKey(name: "_id", defaultValue: '')
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: [], readValue: parseImage)
  List<String> get image;
  @override
  @JsonKey(ignore: true)
  _$$ShopCategoryImplCopyWith<_$ShopCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
