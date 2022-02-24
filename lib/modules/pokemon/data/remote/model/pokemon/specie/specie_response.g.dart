// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecieResponse _$SpecieResponseFromJson(Map<String, dynamic> json) =>
    SpecieResponse(
      (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) =>
              FlavorTextEntriesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecieResponseToJson(SpecieResponse instance) =>
    <String, dynamic>{
      'flavor_text_entries': instance.descriptionList,
    };
