import 'package:json_annotation/json_annotation.dart';
import 'color_response.dart';
import 'flavor_text_entries_response.dart';

part 'specie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpecieResponse {
  SpecieResponse(
    this.color,
    this.flavorTextEntries,
  );
  factory SpecieResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecieResponseFromJson(json);

  final ColorResponse? color;
  final List<FlavorTextEntriesResponse>? flavorTextEntries;

  Map<String, dynamic> toJson() => _$SpecieResponseToJson(this);
}
