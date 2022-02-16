import 'package:json_annotation/json_annotation.dart';

part 'ability_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AbilityResponse {
  AbilityResponse(
    this.name,
    this.url,
  );

  factory AbilityResponse.fromJson(Map<String, dynamic> json) =>
      _$AbilityResponseFromJson(json);

  final String? name;
  final String? url;

  Map<String, dynamic> toJson() => _$AbilityResponseToJson(this);
}
