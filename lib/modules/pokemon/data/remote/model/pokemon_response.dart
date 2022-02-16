import 'package:json_annotation/json_annotation.dart';

part 'pokemon_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonResponse {
  PokemonResponse(
    this.name,
    this.imageUrl,
  );

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  final String name;
  @JsonKey(name: 'url')
  final String imageUrl;

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
