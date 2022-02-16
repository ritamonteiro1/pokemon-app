// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesResponse _$TypesResponseFromJson(Map<String, dynamic> json) =>
    TypesResponse(
      json['slot'] as int?,
      json['type'] == null
          ? null
          : TypeResponse.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypesResponseToJson(TypesResponse instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
