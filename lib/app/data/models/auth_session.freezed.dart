// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) {
  return _AuthSession.fromJson(json);
}

/// @nodoc
mixin _$AuthSession {
  String get authToken => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSessionCopyWith<AuthSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSessionCopyWith<$Res> {
  factory $AuthSessionCopyWith(
          AuthSession value, $Res Function(AuthSession) then) =
      _$AuthSessionCopyWithImpl<$Res, AuthSession>;
  @useResult
  $Res call(
      {String authToken, String userId, String businessName, String userName});
}

/// @nodoc
class _$AuthSessionCopyWithImpl<$Res, $Val extends AuthSession>
    implements $AuthSessionCopyWith<$Res> {
  _$AuthSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = null,
    Object? userId = null,
    Object? businessName = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthSessionImplCopyWith<$Res>
    implements $AuthSessionCopyWith<$Res> {
  factory _$$AuthSessionImplCopyWith(
          _$AuthSessionImpl value, $Res Function(_$AuthSessionImpl) then) =
      __$$AuthSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String authToken, String userId, String businessName, String userName});
}

/// @nodoc
class __$$AuthSessionImplCopyWithImpl<$Res>
    extends _$AuthSessionCopyWithImpl<$Res, _$AuthSessionImpl>
    implements _$$AuthSessionImplCopyWith<$Res> {
  __$$AuthSessionImplCopyWithImpl(
      _$AuthSessionImpl _value, $Res Function(_$AuthSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = null,
    Object? userId = null,
    Object? businessName = null,
    Object? userName = null,
  }) {
    return _then(_$AuthSessionImpl(
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthSessionImpl implements _AuthSession {
  const _$AuthSessionImpl(
      {required this.authToken,
      required this.userId,
      required this.businessName,
      required this.userName});

  factory _$AuthSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthSessionImplFromJson(json);

  @override
  final String authToken;
  @override
  final String userId;
  @override
  final String businessName;
  @override
  final String userName;

  @override
  String toString() {
    return 'AuthSession(authToken: $authToken, userId: $userId, businessName: $businessName, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSessionImpl &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, authToken, userId, businessName, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSessionImplCopyWith<_$AuthSessionImpl> get copyWith =>
      __$$AuthSessionImplCopyWithImpl<_$AuthSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthSessionImplToJson(
      this,
    );
  }
}

abstract class _AuthSession implements AuthSession {
  const factory _AuthSession(
      {required final String authToken,
      required final String userId,
      required final String businessName,
      required final String userName}) = _$AuthSessionImpl;

  factory _AuthSession.fromJson(Map<String, dynamic> json) =
      _$AuthSessionImpl.fromJson;

  @override
  String get authToken;
  @override
  String get userId;
  @override
  String get businessName;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$AuthSessionImplCopyWith<_$AuthSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
