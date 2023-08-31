import 'package:json_annotation/json_annotation.dart';

part "halcyon_defs.g.dart";

/// Represents the folder name of the root folder for storing states of the program.
///
/// A directory sandbox for halcyon!
const String HFOLDER_NAME = "hhalcyon";

/// Every subfolder to be created under [HFOLDER_NAME]
final List<String> HFOLDER_SUBFOLDERS = List.unmodifiable(["config", "cache"]);

/// Represents the default Halcyon configuration JSON
@JsonSerializable(checked: true)
class HConfig {
  /// If debug information should be shown
  @JsonKey(defaultValue: true, name: "H_debug")
  final bool? debug;

  /// If console logging information should be shown
  @JsonKey(defaultValue: true, name: "use_logging")
  final bool? useLogger;

  HConfig({required this.debug, required this.useLogger});

  factory HConfig.fromJson(Map<String, dynamic> json) => _$HConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HConfigToJson(this);
}
