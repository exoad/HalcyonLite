import "package:json_annotation/json_annotation.dart";

part 'tailwind_defs.g.dart';

/// This class represents the Configuration JSON file for the Tailwind audio player.
@JsonSerializable(checked: true)
class TConfig {
  /// Represents whether or not to use debug features for tailwind
  @JsonKey(defaultValue: false, name: "T_debug")
  final bool? debug;

  TConfig({required this.debug});

  factory TConfig.fromJson(Map<String, dynamic> json) => _$TConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TConfigToJson(this);
}