import 'package:hive/hive.dart';

import 'pokemon_cache_data_source.dart';

class PokemonCacheDataSourceImpl implements PokemonCacheDataSource {
  PokemonCacheDataSourceImpl({
    required HiveInterface hive,
  }) : _hive = hive;

  final HiveInterface _hive;
}
