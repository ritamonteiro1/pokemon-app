import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetailsResponse {}
