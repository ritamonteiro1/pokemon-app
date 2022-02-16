import 'package:json_annotation/json_annotation.dart';

import 'ability_response.dart';

part 'abilities_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AbilitiesResponse {
  AbilitiesResponse(
    this.ability,
    this.isHidden,
    this.slot,
  );

  factory AbilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesResponseFromJson(json);

  final AbilityResponse? ability;
  final bool? isHidden;
  final int? slot;

  Map<String, dynamic> toJson() => _$AbilitiesResponseToJson(this);
}
