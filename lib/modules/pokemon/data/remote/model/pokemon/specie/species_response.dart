import 'package:json_annotation/json_annotation.dart';
part 'species_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpeciesResponse {
  SpeciesResponse(
    this.url,
  );

  factory SpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeciesResponseFromJson(json);

  final String url;

  Map<String, dynamic> toJson() => _$SpeciesResponseToJson(this);
}
