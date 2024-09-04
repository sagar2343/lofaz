import 'package:freezed_annotation/freezed_annotation.dart';
part 'social_links.freezed.dart';
part 'social_links.g.dart';

@freezed
class SocialLinks with _$SocialLinks {
  const factory SocialLinks({
    @JsonKey(
      toJson: objToJson,
    )
    SocialLinkItem? facebook,
    @JsonKey(
      toJson: objToJson,
    )
    SocialLinkItem? instagram,
    @JsonKey(
      toJson: objToJson,
    )
    SocialLinkItem? twitter,
    @JsonKey(
      toJson: objToJson,
    )
    SocialLinkItem? linkedin,
  }) = _SocialLinks;

  factory SocialLinks.fromJson(Map<String, dynamic> json) =>
      _$SocialLinksFromJson(json);
}

@freezed
class SocialLinkItem with _$SocialLinkItem {
  const factory SocialLinkItem({
    required String url,
    required int count,
  }) = _SocialLinkItem;

  factory SocialLinkItem.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkItemFromJson(json);
}

Map<String, dynamic>? objToJson(event) => event?.toJson();
