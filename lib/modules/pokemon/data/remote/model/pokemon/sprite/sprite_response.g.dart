// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpriteResponse _$SpriteResponseFromJson(Map<String, dynamic> json) =>
    SpriteResponse(
      json['dream_world'] == null
          ? null
          : DreamWorldResponse.fromJson(
              json['dream_world'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpriteResponseToJson(SpriteResponse instance) =>
    <String, dynamic>{
      'dream_world': instance.dreamWorld,
    };
