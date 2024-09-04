// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unExpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unExpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unExpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoData value) noData,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnExpectedError value) unExpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnExpectedError value)? unExpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoData value)? noData,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnExpectedError value)? unExpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureCopyWith<$Res> {
  factory $ApiFailureCopyWith(
          ApiFailure value, $Res Function(ApiFailure) then) =
      _$ApiFailureCopyWithImpl<$Res, ApiFailure>;
}

/// @nodoc
class _$ApiFailureCopyWithImpl<$Res, $Val extends ApiFailure>
    implements $ApiFailureCopyWith<$Res> {
  _$ApiFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<$Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl value, $Res Function(_$NoInternetImpl) then) =
      __$$NoInternetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'ApiFailure.noInternet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unExpectedError,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unExpectedError,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unExpectedError,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoData value) noData,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnExpectedError value) unExpectedError,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnExpectedError value)? unExpectedError,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoData value)? noData,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnExpectedError value)? unExpectedError,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements ApiFailure {
  const factory _NoInternet() = _$NoInternetImpl;
}

/// @nodoc
abstract class _$$NoDataImplCopyWith<$Res> {
  factory _$$NoDataImplCopyWith(
          _$NoDataImpl value, $Res Function(_$NoDataImpl) then) =
      __$$NoDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoDataImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$NoDataImpl>
    implements _$$NoDataImplCopyWith<$Res> {
  __$$NoDataImplCopyWithImpl(
      _$NoDataImpl _value, $Res Function(_$NoDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoDataImpl implements _NoData {
  const _$NoDataImpl();

  @override
  String toString() {
    return 'ApiFailure.noData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unExpectedError,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unExpectedError,
  }) {
    return noData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unExpectedError,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoData value) noData,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnExpectedError value) unExpectedError,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnExpectedError value)? unExpectedError,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoData value)? noData,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnExpectedError value)? unExpectedError,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class _NoData implements ApiFailure {
  const factory _NoData() = _$NoDataImpl;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$ServerErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements _ServerError {
  const _$ServerErrorImpl({this.errorMessage});

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ApiFailure.serverError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unExpectedError,
  }) {
    return serverError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unExpectedError,
  }) {
    return serverError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unExpectedError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoData value) noData,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnExpectedError value) unExpectedError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnExpectedError value)? unExpectedError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoData value)? noData,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnExpectedError value)? unExpectedError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements ApiFailure {
  const factory _ServerError({final String? errorMessage}) = _$ServerErrorImpl;

  String? get errorMessage;
  @JsonKey(ignore: true)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnExpectedErrorImplCopyWith<$Res> {
  factory _$$UnExpectedErrorImplCopyWith(_$UnExpectedErrorImpl value,
          $Res Function(_$UnExpectedErrorImpl) then) =
      __$$UnExpectedErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$UnExpectedErrorImplCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$UnExpectedErrorImpl>
    implements _$$UnExpectedErrorImplCopyWith<$Res> {
  __$$UnExpectedErrorImplCopyWithImpl(
      _$UnExpectedErrorImpl _value, $Res Function(_$UnExpectedErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$UnExpectedErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnExpectedErrorImpl implements _UnExpectedError {
  const _$UnExpectedErrorImpl({this.errorMessage});

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ApiFailure.unExpectedError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnExpectedErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnExpectedErrorImplCopyWith<_$UnExpectedErrorImpl> get copyWith =>
      __$$UnExpectedErrorImplCopyWithImpl<_$UnExpectedErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noInternet,
    required TResult Function() noData,
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) unExpectedError,
  }) {
    return unExpectedError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noInternet,
    TResult? Function()? noData,
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? unExpectedError,
  }) {
    return unExpectedError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noInternet,
    TResult Function()? noData,
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? unExpectedError,
    required TResult orElse(),
  }) {
    if (unExpectedError != null) {
      return unExpectedError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoData value) noData,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnExpectedError value) unExpectedError,
  }) {
    return unExpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnExpectedError value)? unExpectedError,
  }) {
    return unExpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoData value)? noData,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnExpectedError value)? unExpectedError,
    required TResult orElse(),
  }) {
    if (unExpectedError != null) {
      return unExpectedError(this);
    }
    return orElse();
  }
}

abstract class _UnExpectedError implements ApiFailure {
  const factory _UnExpectedError({final String? errorMessage}) =
      _$UnExpectedErrorImpl;

  String? get errorMessage;
  @JsonKey(ignore: true)
  _$$UnExpectedErrorImplCopyWith<_$UnExpectedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
