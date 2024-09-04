import 'package:freezed_annotation/freezed_annotation.dart';
part 'shop_settings.freezed.dart';
part 'shop_settings.g.dart';

@freezed
class ShopSettings with _$ShopSettings {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory ShopSettings({
    @Default(false) bool orderStatus,
    @Default(false) bool shopStatus,
    @Default(false) bool whatsappStatus,
    String? userId,
  }) = _ShopSettings;

  factory ShopSettings.fromJson(Map<String, dynamic> json) =>
      _$ShopSettingsFromJson(json);
}
