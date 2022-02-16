import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokemon_details/sprit/sprite_response.dart';
part 'sprites_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpritesResponse {
  SpritesResponse(
    this.sprite,
  );
  factory SpritesResponse.fromJson(Map<String, dynamic> json) =>
      _$SpritesResponseFromJson(json);

  @JsonKey(name: 'other')
  final SpriteResponse? sprite;
  Map<String, dynamic> toJson() => _$SpritesResponseToJson(this);
}