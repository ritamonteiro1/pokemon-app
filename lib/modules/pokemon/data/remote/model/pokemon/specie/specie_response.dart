import 'package:json_annotation/json_annotation.dart';

import 'color_response.dart';
import 'flavor_text_entries_response.dart';

part 'specie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpecieResponse {
  SpecieResponse(
    this.color,
    this.descriptionList,
  );

  factory SpecieResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecieResponseFromJson(json);

  final ColorResponse? color;
  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorTextEntriesResponse>? descriptionList;

  Map<String, dynamic> toJson() => _$SpecieResponseToJson(this);
}
