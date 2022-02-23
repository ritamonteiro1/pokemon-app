import 'package:json_annotation/json_annotation.dart';

part 'color_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ColorResponse {
  ColorResponse(
    this.name,
  );

  factory ColorResponse.fromJson(Map<String, dynamic> json) =>
      _$ColorResponseFromJson(json);

  final String? name;

  Map<String, dynamic> toJson() => _$ColorResponseToJson(this);
}
