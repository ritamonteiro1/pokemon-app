import 'package:json_annotation/json_annotation.dart';
import 'stat_response.dart';

part 'stats_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StatsResponse {
  StatsResponse(
    this.baseStat,
    this.stat,
  );

  factory StatsResponse.fromJson(Map<String, dynamic> json) =>
      _$StatsResponseFromJson(json);

  @JsonKey(name: 'base_url')
  final int? baseStat;
  final StatResponse? stat;

  Map<String, dynamic> toJson() => _$StatsResponseToJson(this);
}
