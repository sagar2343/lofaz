// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialLinksImpl _$$SocialLinksImplFromJson(Map<String, dynamic> json) =>
    _$SocialLinksImpl(
      facebook: json['facebook'] == null
          ? null
          : SocialLinkItem.fromJson(json['facebook'] as Map<String, dynamic>),
      instagram: json['instagram'] == null
          ? null
          : SocialLinkItem.fromJson(json['instagram'] as Map<String, dynamic>),
      twitter: json['twitter'] == null
          ? null
          : SocialLinkItem.fromJson(json['twitter'] as Map<String, dynamic>),
      linkedin: json['linkedin'] == null
          ? null
          : SocialLinkItem.fromJson(json['linkedin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SocialLinksImplToJson(_$SocialLinksImpl instance) =>
    <String, dynamic>{
      'facebook': objToJson(instance.facebook),
      'instagram': objToJson(instance.instagram),
      'twitter': objToJson(instance.twitter),
      'linkedin': objToJson(instance.linkedin),
    };

_$SocialLinkItemImpl _$$SocialLinkItemImplFromJson(Map<String, dynamic> json) =>
    _$SocialLinkItemImpl(
      url: json['url'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$SocialLinkItemImplToJson(
        _$SocialLinkItemImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'count': instance.count,
    };
