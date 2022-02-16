import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokemon_details/others/other_response.dart';
part 'sprites_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpritesResponse {
  SpritesResponse(
    this.other,
  );
  factory SpritesResponse.fromJson(Map<String, dynamic> json) =>
      _$SpritesResponseFromJson(json);
  final OtherResponse? other;
  Map<String, dynamic> toJson() => _$SpritesResponseToJson(this);
}
