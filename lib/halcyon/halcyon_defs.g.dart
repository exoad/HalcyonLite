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
          debug: $checkedConvert('H_debug', (v) => v as bool? ?? true),
          useLogger: $checkedConvert('use_logging', (v) => v as bool? ?? true),
        );
        return val;
      },
      fieldKeyMap: const {'debug': 'H_debug', 'useLogger': 'use_logging'},
    );

Map<String, dynamic> _$HConfigToJson(HConfig instance) => <String, dynamic>{
      'H_debug': instance.debug,
      'use_logging': instance.useLogger,
    };
