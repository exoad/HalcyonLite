// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'halcyon_defs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HConfig _$HConfigFromJson(Map<String, dynamic> json) => $checkedCreate(
      'HConfig',
      json,
      ($checkedConvert) {
        final val = HConfig(
          debug: $checkedConvert('debug', (v) => v as bool? ?? true),
        );
        return val;
      },
    );

Map<String, dynamic> _$HConfigToJson(HConfig instance) => <String, dynamic>{
      'debug': instance.debug,
    };
