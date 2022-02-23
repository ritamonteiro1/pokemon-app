import 'package:hive/hive.dart';

import '../../data/cache/data_source/pokemon_cache_data_source.dart';
import '../../data/cache/model/pokemon_cache.dart';
import '../../data/mapper/cache_to_model.dart';
import '../../data/mapper/model_to_cache.dart';
import '../../domain/exception/generic_cache_exception.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonCacheDataSourceImpl implements PokemonCacheDataSource {
  PokemonCacheDataSourceImpl({
    required HiveInterface hive,
  }) : _hive = hive;

  final HiveInterface _hive;
  static const _favoritePokemonListKeyString = 'favoritePokemonListKeyString';

  @override
  Future<void> addFavoritePokemon(PokemonModel pokemonModel) async {
    final pokemonCache = pokemonModel.toPokemonCache();
    final box = await _hive.openBox(_favoritePokemonListKeyString);
    await box.put(pokemonModel.id, pokemonCache);
  }

  @override
  Future<void> removeFavoritePokemon(PokemonModel pokemonModel) async {
    final pokemonCache = pokemonModel.toPokemonCache();
    final box = await _hive.openBox(_favoritePokemonListKeyString);
    await box.delete(pokemonCache.id);
  }

  @override
  Future<List<PokemonModel>> getFavoritePokemonList() async {
    try {
      final box = await _hive.openBox(_favoritePokemonListKeyString);
      final favoritePokemonCacheList = List<PokemonCache>.from(box.values);
      if (favoritePokemonCacheList.isNotEmpty) {
        return favoritePokemonCacheList.toPokemonModelList();
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      throw GenericCacheException();
    }
  }
}
