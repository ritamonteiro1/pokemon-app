import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokemon_details/others/sprites_response.dart';

import '../ability/abilities_response.dart';
import '../stat/stats_response.dart';
import '../type/types_response.dart';

part 'pokemon_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetailsResponse {
  PokemonDetailsResponse(
    this.abilities,
    this.height,
    this.id,
    this.name,
    this.stats,
    this.types,
    this.weight,
    this.sprites,
  );

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsResponseFromJson(json);

  final List<AbilitiesResponse>? abilities;
  final int? height;
  final int? id;
  final String? name;
  final List<StatsResponse>? stats;
  final List<TypesResponse>? types;
  final int? weight;
  final SpritesResponse? sprites;

  Map<String, dynamic> toJson() => _$PokemonDetailsResponseToJson(this);
}
