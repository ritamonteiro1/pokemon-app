// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokedexResponse _$PokedexResponseFromJson(Map<String, dynamic> json) =>
    PokedexResponse(
      (json['results'] as List<dynamic>)
          .map((e) => PokemonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokedexResponseToJson(PokedexResponse instance) =>
    <String, dynamic>{
      'results': instance.pokemons,
    };
