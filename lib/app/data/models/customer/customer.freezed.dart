// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) {
  return _CustomerResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerResponse {
  @JsonKey(defaultValue: [])
  List<Customer> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'total', defaultValue: 0)
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerResponseCopyWith<CustomerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerResponseCopyWith<$Res> {
  factory $CustomerResponseCopyWith(
          CustomerResponse value, $Res Function(CustomerResponse) then) =
      _$CustomerResponseCopyWithImpl<$Res, CustomerResponse>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<Customer> data,
      @JsonKey(name: 'total', defaultValue: 0) int total});
}

/// @nodoc
class _$CustomerResponseCopyWithImpl<$Res, $Val extends CustomerResponse>
    implements $CustomerResponseCopyWith<$Res> {
  _$CustomerResponseCopyWithImpl(this._value, this._then);

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
              as List<Customer>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerResponseImplCopyWith<$Res>
    implements $CustomerResponseCopyWith<$Res> {
  factory _$$CustomerResponseImplCopyWith(_$CustomerResponseImpl value,
          $Res Function(_$CustomerResponseImpl) then) =
      __$$CustomerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<Customer> data,
      @JsonKey(name: 'total', defaultValue: 0) int total});
}

/// @nodoc
class __$$CustomerResponseImplCopyWithImpl<$Res>
    extends _$CustomerResponseCopyWithImpl<$Res, _$CustomerResponseImpl>
    implements _$$CustomerResponseImplCopyWith<$Res> {
  __$$CustomerResponseImplCopyWithImpl(_$CustomerResponseImpl _value,
      $Res Function(_$CustomerResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
  }) {
    return _then(_$CustomerResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerResponseImpl implements _CustomerResponse {
  const _$CustomerResponseImpl(
      {@JsonKey(defaultValue: []) required final List<Customer> data,
      @JsonKey(name: 'total', defaultValue: 0) required this.total})
      : _data = data;

  factory _$CustomerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerResponseImplFromJson(json);

  final List<Customer> _data;
  @override
  @JsonKey(defaultValue: [])
  List<Customer> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'total', defaultValue: 0)
  final int total;

  @override
  String toString() {
    return 'CustomerResponse(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerResponseImpl &&
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
  _$$CustomerResponseImplCopyWith<_$CustomerResponseImpl> get copyWith =>
      __$$CustomerResponseImplCopyWithImpl<_$CustomerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerResponseImplToJson(
      this,
    );
  }
}

abstract class _CustomerResponse implements CustomerResponse {
  const factory _CustomerResponse(
          {@JsonKey(defaultValue: []) required final List<Customer> data,
          @JsonKey(name: 'total', defaultValue: 0) required final int total}) =
      _$CustomerResponseImpl;

  factory _CustomerResponse.fromJson(Map<String, dynamic> json) =
      _$CustomerResponseImpl.fromJson;

  @override
  @JsonKey(defaultValue: [])
  List<Customer> get data;
  @override
  @JsonKey(name: 'total', defaultValue: 0)
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$CustomerResponseImplCopyWith<_$CustomerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  @JsonKey(defaultValue: '', name: '_id')
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(readValue: parseProfile)
  Profile get profile => throw _privateConstructorUsedError;
  Total get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '', name: '_id') String id,
      DateTime createdAt,
      DateTime updatedAt,
      @JsonKey(readValue: parseProfile) Profile profile,
      Total total});

  $ProfileCopyWith<$Res> get profile;
  $TotalCopyWith<$Res> get total;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? profile = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Total,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TotalCopyWith<$Res> get total {
    return $TotalCopyWith<$Res>(_value.total, (value) {
      return _then(_value.copyWith(total: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '', name: '_id') String id,
      DateTime createdAt,
      DateTime updatedAt,
      @JsonKey(readValue: parseProfile) Profile profile,
      Total total});

  @override
  $ProfileCopyWith<$Res> get profile;
  @override
  $TotalCopyWith<$Res> get total;
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? profile = null,
    Object? total = null,
  }) {
    return _then(_$CustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Total,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl implements _Customer {
  const _$CustomerImpl(
      {@JsonKey(defaultValue: '', name: '_id') required this.id,
      required this.createdAt,
      required this.updatedAt,
      @JsonKey(readValue: parseProfile) required this.profile,
      required this.total});

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  @JsonKey(defaultValue: '', name: '_id')
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey(readValue: parseProfile)
  final Profile profile;
  @override
  final Total total;

  @override
  String toString() {
    return 'Customer(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, profile: $profile, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, updatedAt, profile, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer implements Customer {
  const factory _Customer(
      {@JsonKey(defaultValue: '', name: '_id') required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      @JsonKey(readValue: parseProfile) required final Profile profile,
      required final Total total}) = _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  @JsonKey(defaultValue: '', name: '_id')
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(readValue: parseProfile)
  Profile get profile;
  @override
  Total get total;
  @override
  @JsonKey(ignore: true)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  @JsonKey(defaultValue: 0)
  int get phone => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<Location> get location => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '', name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 0) int phone,
      @JsonKey(defaultValue: []) List<Location> location,
      @JsonKey(defaultValue: '', name: 'full_name') String fullName});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? location = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<Location>,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 0) int phone,
      @JsonKey(defaultValue: []) List<Location> location,
      @JsonKey(defaultValue: '', name: 'full_name') String fullName});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? location = null,
    Object? fullName = null,
  }) {
    return _then(_$ProfileImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<Location>,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {@JsonKey(defaultValue: 0) required this.phone,
      @JsonKey(defaultValue: []) required final List<Location> location,
      @JsonKey(defaultValue: '', name: 'full_name') required this.fullName})
      : _location = location;

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  @JsonKey(defaultValue: 0)
  final int phone;
  final List<Location> _location;
  @override
  @JsonKey(defaultValue: [])
  List<Location> get location {
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_location);
  }

  @override
  @JsonKey(defaultValue: '', name: 'full_name')
  final String fullName;

  @override
  String toString() {
    return 'Profile(phone: $phone, location: $location, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phone,
      const DeepCollectionEquality().hash(_location), fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {@JsonKey(defaultValue: 0) required final int phone,
      @JsonKey(defaultValue: []) required final List<Location> location,
      @JsonKey(defaultValue: '', name: 'full_name')
      required final String fullName}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  @JsonKey(defaultValue: 0)
  int get phone;
  @override
  @JsonKey(defaultValue: [])
  List<Location> get location;
  @override
  @JsonKey(defaultValue: '', name: 'full_name')
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  @JsonKey(defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<String> get address => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '', name: 'zip_code')
  String get zipCode => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '', name: '_id')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String type,
      @JsonKey(defaultValue: []) List<String> address,
      @JsonKey(defaultValue: '') String city,
      @JsonKey(defaultValue: '') String state,
      @JsonKey(defaultValue: '', name: 'zip_code') String zipCode,
      @JsonKey(defaultValue: '') String country,
      @JsonKey(defaultValue: '', name: '_id') String id});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

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
    Object? state = null,
    Object? zipCode = null,
    Object? country = null,
    Object? id = null,
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
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String type,
      @JsonKey(defaultValue: []) List<String> address,
      @JsonKey(defaultValue: '') String city,
      @JsonKey(defaultValue: '') String state,
      @JsonKey(defaultValue: '', name: 'zip_code') String zipCode,
      @JsonKey(defaultValue: '') String country,
      @JsonKey(defaultValue: '', name: '_id') String id});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? country = null,
    Object? id = null,
  }) {
    return _then(_$LocationImpl(
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
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
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
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {@JsonKey(defaultValue: '') required this.type,
      @JsonKey(defaultValue: []) required final List<String> address,
      @JsonKey(defaultValue: '') required this.city,
      @JsonKey(defaultValue: '') required this.state,
      @JsonKey(defaultValue: '', name: 'zip_code') required this.zipCode,
      @JsonKey(defaultValue: '') required this.country,
      @JsonKey(defaultValue: '', name: '_id') required this.id})
      : _address = address;

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String type;
  final List<String> _address;
  @override
  @JsonKey(defaultValue: [])
  List<String> get address {
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_address);
  }

  @override
  @JsonKey(defaultValue: '')
  final String city;
  @override
  @JsonKey(defaultValue: '')
  final String state;
  @override
  @JsonKey(defaultValue: '', name: 'zip_code')
  final String zipCode;
  @override
  @JsonKey(defaultValue: '')
  final String country;
  @override
  @JsonKey(defaultValue: '', name: '_id')
  final String id;

  @override
  String toString() {
    return 'Location(type: $type, address: $address, city: $city, state: $state, zipCode: $zipCode, country: $country, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_address),
      city,
      state,
      zipCode,
      country,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
          {@JsonKey(defaultValue: '') required final String type,
          @JsonKey(defaultValue: []) required final List<String> address,
          @JsonKey(defaultValue: '') required final String city,
          @JsonKey(defaultValue: '') required final String state,
          @JsonKey(defaultValue: '', name: 'zip_code')
          required final String zipCode,
          @JsonKey(defaultValue: '') required final String country,
          @JsonKey(defaultValue: '', name: '_id') required final String id}) =
      _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get type;
  @override
  @JsonKey(defaultValue: [])
  List<String> get address;
  @override
  @JsonKey(defaultValue: '')
  String get city;
  @override
  @JsonKey(defaultValue: '')
  String get state;
  @override
  @JsonKey(defaultValue: '', name: 'zip_code')
  String get zipCode;
  @override
  @JsonKey(defaultValue: '')
  String get country;
  @override
  @JsonKey(defaultValue: '', name: '_id')
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Total _$TotalFromJson(Map<String, dynamic> json) {
  return _Total.fromJson(json);
}

/// @nodoc
mixin _$Total {
  @JsonKey(defaultValue: 0)
  int get wishlist => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get cart => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotalCopyWith<Total> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalCopyWith<$Res> {
  factory $TotalCopyWith(Total value, $Res Function(Total) then) =
      _$TotalCopyWithImpl<$Res, Total>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 0) int wishlist,
      @JsonKey(defaultValue: 0) int cart,
      @JsonKey(defaultValue: 0) int order});
}

/// @nodoc
class _$TotalCopyWithImpl<$Res, $Val extends Total>
    implements $TotalCopyWith<$Res> {
  _$TotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishlist = null,
    Object? cart = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      wishlist: null == wishlist
          ? _value.wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as int,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalImplCopyWith<$Res> implements $TotalCopyWith<$Res> {
  factory _$$TotalImplCopyWith(
          _$TotalImpl value, $Res Function(_$TotalImpl) then) =
      __$$TotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 0) int wishlist,
      @JsonKey(defaultValue: 0) int cart,
      @JsonKey(defaultValue: 0) int order});
}

/// @nodoc
class __$$TotalImplCopyWithImpl<$Res>
    extends _$TotalCopyWithImpl<$Res, _$TotalImpl>
    implements _$$TotalImplCopyWith<$Res> {
  __$$TotalImplCopyWithImpl(
      _$TotalImpl _value, $Res Function(_$TotalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishlist = null,
    Object? cart = null,
    Object? order = null,
  }) {
    return _then(_$TotalImpl(
      wishlist: null == wishlist
          ? _value.wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as int,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalImpl implements _Total {
  const _$TotalImpl(
      {@JsonKey(defaultValue: 0) required this.wishlist,
      @JsonKey(defaultValue: 0) required this.cart,
      @JsonKey(defaultValue: 0) required this.order});

  factory _$TotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalImplFromJson(json);

  @override
  @JsonKey(defaultValue: 0)
  final int wishlist;
  @override
  @JsonKey(defaultValue: 0)
  final int cart;
  @override
  @JsonKey(defaultValue: 0)
  final int order;

  @override
  String toString() {
    return 'Total(wishlist: $wishlist, cart: $cart, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalImpl &&
            (identical(other.wishlist, wishlist) ||
                other.wishlist == wishlist) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, wishlist, cart, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalImplCopyWith<_$TotalImpl> get copyWith =>
      __$$TotalImplCopyWithImpl<_$TotalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalImplToJson(
      this,
    );
  }
}

abstract class _Total implements Total {
  const factory _Total(
      {@JsonKey(defaultValue: 0) required final int wishlist,
      @JsonKey(defaultValue: 0) required final int cart,
      @JsonKey(defaultValue: 0) required final int order}) = _$TotalImpl;

  factory _Total.fromJson(Map<String, dynamic> json) = _$TotalImpl.fromJson;

  @override
  @JsonKey(defaultValue: 0)
  int get wishlist;
  @override
  @JsonKey(defaultValue: 0)
  int get cart;
  @override
  @JsonKey(defaultValue: 0)
  int get order;
  @override
  @JsonKey(ignore: true)
  _$$TotalImplCopyWith<_$TotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
