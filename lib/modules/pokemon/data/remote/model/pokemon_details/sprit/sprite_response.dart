import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokemon_details/dream_world/dream_world_response.dart';

part 'sprite_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpriteResponse {
  SpriteResponse(
    this.dreamWorld,
  );

  factory SpriteResponse.fromJson(Map<String, dynamic> json) =>
      _$SpriteResponseFromJson(json);

  final DreamWorldResponse? dreamWorld;
  Map<String, dynamic> toJson() => _$SpriteResponseToJson(this);
}
