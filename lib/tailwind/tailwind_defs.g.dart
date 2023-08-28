// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tailwind_defs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TConfig _$TConfigFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TConfig',
      json,
      ($checkedConvert) {
        final val = TConfig(
          debug: $checkedConvert('T_debug', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {'debug': 'T_debug'},
    );

Map<String, dynamic> _$TConfigToJson(TConfig instance) => <String, dynamic>{
      'T_debug': instance.debug,
    };
