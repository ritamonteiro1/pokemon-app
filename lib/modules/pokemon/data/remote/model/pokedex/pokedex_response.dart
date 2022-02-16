import 'package:json_annotation/json_annotation.dart';
import '../pokemon_url/pokemon_url_response.dart';

part 'pokedex_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokedexResponse {
  PokedexResponse(
    this.pokemonUrlList,
    this.nextUrl,
  );

  factory PokedexResponse.fromJson(Map<String, dynamic> json) =>
      _$PokedexResponseFromJson(json);

  @JsonKey(name: 'results')
  final List<PokemonUrlResponse> pokemonUrlList;
  @JsonKey(name: 'next')
  final String nextUrl;

  Map<String, dynamic> toJson() => _$PokedexResponseToJson(this);
}
