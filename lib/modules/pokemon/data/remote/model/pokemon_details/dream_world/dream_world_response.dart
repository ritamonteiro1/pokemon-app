import 'package:json_annotation/json_annotation.dart';

part 'dream_world_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DreamWorldResponse {
  DreamWorldResponse(
    this.image,
  );

  factory DreamWorldResponse.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldResponseFromJson(json);

  @JsonKey(name: 'frontDefault')
  final String? image;

  Map<String, dynamic> toJson() => _$DreamWorldResponseToJson(this);
}
