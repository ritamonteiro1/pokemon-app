// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilitiesResponse _$AbilitiesResponseFromJson(Map<String, dynamic> json) =>
    AbilitiesResponse(
      json['ability'] == null
          ? null
          : AbilityResponse.fromJson(json['ability'] as Map<String, dynamic>),
      json['is_hidden'] as bool?,
      json['slot'] as int?,
    );

Map<String, dynamic> _$AbilitiesResponseToJson(AbilitiesResponse instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };
