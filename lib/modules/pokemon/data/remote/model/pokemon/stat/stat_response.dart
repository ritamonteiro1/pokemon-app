import 'package:json_annotation/json_annotation.dart';

part 'stat_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StatResponse {
  StatResponse(
    this.name,
  );

  factory StatResponse.fromJson(Map<String, dynamic> json) =>
      _$StatResponseFromJson(json);

  final String? name;

  Map<String, dynamic> toJson() => _$StatResponseToJson(this);
}
