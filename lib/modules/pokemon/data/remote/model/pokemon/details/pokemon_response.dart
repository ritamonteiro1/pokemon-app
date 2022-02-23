import 'package:json_annotation/json_annotation.dart';

import '../ability/abilities_response.dart';
import '../stat/stats_response.dart';
import '../type/types_response.dart';

part 'pokemon_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonResponse {
  PokemonResponse(
    this.abilities,
    this.height,
    this.id,
    this.name,
    this.stats,
    this.types,
    this.weight,
  );

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  final List<AbilitiesResponse>? abilities;
  final int? height;
  final int id;
  final String? name;
  final List<StatsResponse>? stats;
  final List<TypesResponse>? types;
  final int? weight;

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
