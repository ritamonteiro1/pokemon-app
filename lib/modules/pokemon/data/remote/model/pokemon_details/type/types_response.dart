import 'package:json_annotation/json_annotation.dart';
import '../type/type_response.dart';

part 'types_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TypesResponse {
  TypesResponse(
    this.slot,
    this.type,
  );

  factory TypesResponse.fromJson(Map<String, dynamic> json) =>
      _$TypesResponseFromJson(json);

  final int? slot;
  final TypeResponse? type;

  Map<String, dynamic> toJson() => _$TypesResponseToJson(this);
}
