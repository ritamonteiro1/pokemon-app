import 'package:hive/hive.dart';
import 'package:pokedex_app/modules/pokemon/data/mapper/model_to_cache.dart';

import '../../../domain/model/pokemon/pokemon_model.dart';
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
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonModel>> getFavoritePokemonList() async {
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavoritePokemon(PokemonModel pokemonModel) async {
    final pokemonCache = pokemonModel.toPokemonCache();
    final box = await Hive.openBox(_favoritePokemonListKeyString);
    await box.put(pokemonModel.id, pokemonCache);
  }
}
