import 'package:hive/hive.dart';

import 'stat_cache.dart';

part 'pokemon_cache.g.dart';

@HiveType(typeId: 0)
class PokemonCache {
  PokemonCache({
    required this.abilityList,
    required this.height,
    required this.id,
    required this.name,
    required this.statList,
    required this.typeList,
    required this.weight,
    required this.image,
    required this.colorNameByFirstType,
    required this.description,
  });

  @HiveField(0)
  final List<String> abilityList;
  @HiveField(1)
  final int height;
  @HiveField(2)
  final int id;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final List<StatCache> statList;
  @HiveField(5)
  final List<String> typeList;
  @HiveField(6)
  final int weight;
  @HiveField(7)
  final String image;
  @HiveField(8)
  final String colorNameByFirstType;
  @HiveField(9)
  final String description;
}
