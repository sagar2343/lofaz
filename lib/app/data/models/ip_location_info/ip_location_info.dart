import 'package:freezed_annotation/freezed_annotation.dart';
part 'ip_location_info.freezed.dart';
part 'ip_location_info.g.dart';

@freezed
class IpLocationInfo with _$IpLocationInfo {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory IpLocationInfo({
    String? ip,
    String? network,
    String? version,
    String? city,
    String? region,
    String? regionCode,
    String? country,
    String? countryName,
    String? countryCode,
    String? countryCodeIso3,
    String? countryCapital,
    String? countryTld,
    String? continentCode,
    bool? inEu,
    String? postal,
    double? latitude,
    double? longitude,
    String? timezone,
    String? utcOffset,
    String? countryCallingCode,
    String? currency,
    String? currencyName,
    String? languages,
    String? asn,
    String? org,
  }) = _IpLocationInfo;

  factory IpLocationInfo.fromJson(Map<String, dynamic> json) =>
      _$IpLocationInfoFromJson(json);
}
