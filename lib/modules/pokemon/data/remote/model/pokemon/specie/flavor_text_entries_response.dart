import 'package:json_annotation/json_annotation.dart';

part 'flavor_text_entries_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FlavorTextEntriesResponse {
  FlavorTextEntriesResponse(
    this.description,
  );

  factory FlavorTextEntriesResponse.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntriesResponseFromJson(json);

  @JsonKey(name: 'flavor_text')
  final String? description;

  Map<String, dynamic> toJson() => _$FlavorTextEntriesResponseToJson(this);
}
