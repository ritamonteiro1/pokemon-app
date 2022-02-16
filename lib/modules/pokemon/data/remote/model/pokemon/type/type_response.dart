import 'package:json_annotation/json_annotation.dart';

part 'type_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TypeResponse {
  TypeResponse(
    this.name,
  );
  factory TypeResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeResponseFromJson(json);

  final String? name;

  Map<String, dynamic> toJson() => _$TypeResponseToJson(this);
}
