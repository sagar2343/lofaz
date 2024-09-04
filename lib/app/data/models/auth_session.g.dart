// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthSessionImpl _$$AuthSessionImplFromJson(Map<String, dynamic> json) =>
    _$AuthSessionImpl(
      authToken: json['authToken'] as String,
      userId: json['userId'] as String,
      businessName: json['businessName'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$AuthSessionImplToJson(_$AuthSessionImpl instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'userId': instance.userId,
      'businessName': instance.businessName,
      'userName': instance.userName,
    };
