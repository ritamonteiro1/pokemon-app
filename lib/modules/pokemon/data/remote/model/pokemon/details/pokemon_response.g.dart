// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilitiesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['height'] as int?,
      json['id'] as int?,
      json['name'] as String?,
      (json['stats'] as List<dynamic>?)
          ?.map((e) => StatsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['types'] as List<dynamic>?)
          ?.map((e) => TypesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['weight'] as int?,
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };
