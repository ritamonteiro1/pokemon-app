// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsResponse _$StatsResponseFromJson(Map<String, dynamic> json) =>
    StatsResponse(
      json['base_stat'] as int?,
      json['stat'] == null
          ? null
          : StatResponse.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsResponseToJson(StatsResponse instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };
