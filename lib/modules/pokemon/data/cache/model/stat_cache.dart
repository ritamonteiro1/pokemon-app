import 'package:hive/hive.dart';

part 'stat_cache.g.dart';

@HiveType(typeId: 1)
class StatCache {
  StatCache({
    required this.name,
    required this.base,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final int base;
}
