// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_location_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IpLocationInfoImpl _$$IpLocationInfoImplFromJson(Map<String, dynamic> json) =>
    _$IpLocationInfoImpl(
      ip: json['ip'] as String?,
      network: json['network'] as String?,
      version: json['version'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      regionCode: json['region_code'] as String?,
      country: json['country'] as String?,
      countryName: json['country_name'] as String?,
      countryCode: json['country_code'] as String?,
      countryCodeIso3: json['country_code_iso3'] as String?,
      countryCapital: json['country_capital'] as String?,
      countryTld: json['country_tld'] as String?,
      continentCode: json['continent_code'] as String?,
      inEu: json['in_eu'] as bool?,
      postal: json['postal'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      utcOffset: json['utc_offset'] as String?,
      countryCallingCode: json['country_calling_code'] as String?,
      currency: json['currency'] as String?,
      currencyName: json['currency_name'] as String?,
      languages: json['languages'] as String?,
      asn: json['asn'] as String?,
      org: json['org'] as String?,
    );

Map<String, dynamic> _$$IpLocationInfoImplToJson(
        _$IpLocationInfoImpl instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'network': instance.network,
      'version': instance.version,
      'city': instance.city,
      'region': instance.region,
      'region_code': instance.regionCode,
      'country': instance.country,
      'country_name': instance.countryName,
      'country_code': instance.countryCode,
      'country_code_iso3': instance.countryCodeIso3,
      'country_capital': instance.countryCapital,
      'country_tld': instance.countryTld,
      'continent_code': instance.continentCode,
      'in_eu': instance.inEu,
      'postal': instance.postal,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'utc_offset': instance.utcOffset,
      'country_calling_code': instance.countryCallingCode,
      'currency': instance.currency,
      'currency_name': instance.currencyName,
      'languages': instance.languages,
      'asn': instance.asn,
      'org': instance.org,
    };
