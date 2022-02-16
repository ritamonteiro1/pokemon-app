import 'package:json_annotation/json_annotation.dart';
import 'stat_response.dart';

part 'stats_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StatsResponse {
  StatsResponse(
    this.baseStat,
    this.effort,
    this.stat,
  );

  factory StatsResponse.fromJson(Map<String, dynamic> json) =>
      _$StatsResponseFromJson(json);

  final int? baseStat;
  final int? effort;
  final StatResponse? stat;

  Map<String, dynamic> toJson() => _$StatsResponseToJson(this);
}
