import 'package:hive/hive.dart';

import '../../../domain/exception/empty_favorite_pokemon_list_exception.dart';
import '../../../domain/model/pokemon/pokemon_model.dart';
import '../../mapper/cache_to_model.dart';
import '../../mapper/model_to_cache.dart';
import '../model/pokemon_cache.dart';
import 'pokemon_cache_data_source.dart';

class PokemonCacheDataSourceImpl implements PokemonCacheDataSource {
  PokemonCacheDataSourceImpl({
    required HiveInterface hive,
  }) : _hive = hive;

  final HiveInterface _hive;
  static const _favoritePokemonListKeyString = 'favoritePokemonListKeyString';
  static const _favoritePokemonListKeyInt = 0;

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
    final box = await _hive.openBox(_favoritePokemonListKeyString);
    final favoritePokemonCacheList = List<PokemonCache>.from(box.values);
    if (favoritePokemonCacheList.isNotEmpty) {
      return favoritePokemonCacheList.toPokemonModelList();
    } else {
      throw EmptyFavoritePokemonListException();
    }
  }
}
