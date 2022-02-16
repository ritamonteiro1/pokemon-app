import 'package:json_annotation/json_annotation.dart';

part 'pokemon_url_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonUrlResponse {
  PokemonUrlResponse(
    this.url,
  );

  factory PokemonUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonUrlResponseFromJson(json);

  final String url;

  Map<String, dynamic> toJson() => _$PokemonUrlResponseToJson(this);
}
