import 'package:json_annotation/json_annotation.dart';

part 'pokemon_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonResponse {
  PokemonResponse(
    this.id,
    this.name,
  );

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  final int id;
  final String name;

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
