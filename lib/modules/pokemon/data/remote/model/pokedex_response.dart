import 'package:json_annotation/json_annotation.dart';

import 'pokemon_response.dart';

part 'pokedex_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokedexResponse {
  PokedexResponse(
    this.pokemons,
  );

  factory PokedexResponse.fromJson(Map<String, dynamic> json) =>
      _$PokedexResponseFromJson(json);

  @JsonKey(name: 'results')
  final List<PokemonResponse> pokemons;

  Map<String, dynamic> toJson() => _$PokedexResponseToJson(this);
}
