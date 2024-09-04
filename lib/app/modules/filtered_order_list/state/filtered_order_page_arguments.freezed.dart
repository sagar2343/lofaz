// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filtered_order_page_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilteredOrderPageArguments {
  String get title => throw _privateConstructorUsedError;
  List<Order> get order => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilteredOrderPageArgumentsCopyWith<FilteredOrderPageArguments>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilteredOrderPageArgumentsCopyWith<$Res> {
  factory $FilteredOrderPageArgumentsCopyWith(FilteredOrderPageArguments value,
          $Res Function(FilteredOrderPageArguments) then) =
      _$FilteredOrderPageArgumentsCopyWithImpl<$Res,
          FilteredOrderPageArguments>;
  @useResult
  $Res call({String title, List<Order> order});
}

/// @nodoc
class _$FilteredOrderPageArgumentsCopyWithImpl<$Res,
        $Val extends FilteredOrderPageArguments>
    implements $FilteredOrderPageArgumentsCopyWith<$Res> {
  _$FilteredOrderPageArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilteredOrderPageArgumentsImplCopyWith<$Res>
    implements $FilteredOrderPageArgumentsCopyWith<$Res> {
  factory _$$FilteredOrderPageArgumentsImplCopyWith(
          _$FilteredOrderPageArgumentsImpl value,
          $Res Function(_$FilteredOrderPageArgumentsImpl) then) =
      __$$FilteredOrderPageArgumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<Order> order});
}

/// @nodoc
class __$$FilteredOrderPageArgumentsImplCopyWithImpl<$Res>
    extends _$FilteredOrderPageArgumentsCopyWithImpl<$Res,
        _$FilteredOrderPageArgumentsImpl>
    implements _$$FilteredOrderPageArgumentsImplCopyWith<$Res> {
  __$$FilteredOrderPageArgumentsImplCopyWithImpl(
      _$FilteredOrderPageArgumentsImpl _value,
      $Res Function(_$FilteredOrderPageArgumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? order = null,
  }) {
    return _then(_$FilteredOrderPageArgumentsImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value._order
          : order // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc

class _$FilteredOrderPageArgumentsImpl implements _FilteredOrderPageArguments {
  const _$FilteredOrderPageArgumentsImpl(
      {required this.title, required final List<Order> order})
      : _order = order;

  @override
  final String title;
  final List<Order> _order;
  @override
  List<Order> get order {
    if (_order is EqualUnmodifiableListView) return _order;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_order);
  }

  @override
  String toString() {
    return 'FilteredOrderPageArguments(title: $title, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredOrderPageArgumentsImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._order, _order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_order));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredOrderPageArgumentsImplCopyWith<_$FilteredOrderPageArgumentsImpl>
      get copyWith => __$$FilteredOrderPageArgumentsImplCopyWithImpl<
          _$FilteredOrderPageArgumentsImpl>(this, _$identity);
}

abstract class _FilteredOrderPageArguments
    implements FilteredOrderPageArguments {
  const factory _FilteredOrderPageArguments(
      {required final String title,
      required final List<Order> order}) = _$FilteredOrderPageArgumentsImpl;

  @override
  String get title;
  @override
  List<Order> get order;
  @override
  @JsonKey(ignore: true)
  _$$FilteredOrderPageArgumentsImplCopyWith<_$FilteredOrderPageArgumentsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
