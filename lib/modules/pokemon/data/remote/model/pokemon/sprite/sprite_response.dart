import 'package:json_annotation/json_annotation.dart';
import '../dream_world/dream_world_response.dart';

part 'sprite_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpriteResponse {
  SpriteResponse(
    this.dreamWorld,
  );

  factory SpriteResponse.fromJson(Map<String, dynamic> json) =>
      _$SpriteResponseFromJson(json);

  @JsonKey(name: 'dream_world')
  final DreamWorldResponse? dreamWorld;
  Map<String, dynamic> toJson() => _$SpriteResponseToJson(this);
}
