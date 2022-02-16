import 'dream_world_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'other_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OtherResponse {
  OtherResponse(
    this.dreamWorld,
  );

  factory OtherResponse.fromJson(Map<String, dynamic> json) =>
      _$OtherResponseFromJson(json);
  final DreamWorldResponse? dreamWorld;
  Map<String, dynamic> toJson() => _$OtherResponseToJson(this);
}
