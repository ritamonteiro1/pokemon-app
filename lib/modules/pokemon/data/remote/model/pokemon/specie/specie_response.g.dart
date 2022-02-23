// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecieResponse _$SpecieResponseFromJson(Map<String, dynamic> json) =>
    SpecieResponse(
      json['color'] == null
          ? null
          : ColorResponse.fromJson(json['color'] as Map<String, dynamic>),
      (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) =>
              FlavorTextEntriesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecieResponseToJson(SpecieResponse instance) =>
    <String, dynamic>{
      'color': instance.color,
      'flavor_text_entries': instance.descriptionList,
    };
