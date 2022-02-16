// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsResponse _$PokemonDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsResponse(
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
      json['sprites'] == null
          ? null
          : SpritesResponse.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonDetailsResponseToJson(
        PokemonDetailsResponse instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
      'sprites': instance.sprites,
    };
