// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpritesResponse _$SpritesResponseFromJson(Map<String, dynamic> json) =>
    SpritesResponse(
      json['other'] == null
          ? null
          : OtherResponse.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpritesResponseToJson(SpritesResponse instance) =>
    <String, dynamic>{
      'other': instance.other,
    };
