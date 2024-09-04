// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopSettingsImpl _$$ShopSettingsImplFromJson(Map<String, dynamic> json) =>
    _$ShopSettingsImpl(
      orderStatus: json['order_status'] as bool? ?? false,
      shopStatus: json['shop_status'] as bool? ?? false,
      whatsappStatus: json['whatsapp_status'] as bool? ?? false,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$ShopSettingsImplToJson(_$ShopSettingsImpl instance) =>
    <String, dynamic>{
      'order_status': instance.orderStatus,
      'shop_status': instance.shopStatus,
      'whatsapp_status': instance.whatsappStatus,
      'user_id': instance.userId,
    };
