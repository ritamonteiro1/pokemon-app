// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherResponse _$OtherResponseFromJson(Map<String, dynamic> json) =>
    OtherResponse(
      json['dream_world'] == null
          ? null
          : DreamWorldResponse.fromJson(
              json['dream_world'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherResponseToJson(OtherResponse instance) =>
    <String, dynamic>{
      'dream_world': instance.dreamWorld,
    };
