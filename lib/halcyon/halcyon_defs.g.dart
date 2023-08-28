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
        );
        return val;
      },
      fieldKeyMap: const {'debug': 'H_debug'},
    );

Map<String, dynamic> _$HConfigToJson(HConfig instance) => <String, dynamic>{
      'H_debug': instance.debug,
    };
