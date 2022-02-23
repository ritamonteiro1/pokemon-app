import 'package:json_annotation/json_annotation.dart';

part 'flavor_text_entries_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FlavorTextEntriesResponse {
  FlavorTextEntriesResponse(
    this.flavorText,
  );

  factory FlavorTextEntriesResponse.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntriesResponseFromJson(json);

  final String? flavorText;

  Map<String, dynamic> toJson() => _$FlavorTextEntriesResponseToJson(this);

}
