import '../../../domain/model/pokemon/pokemon_model.dart';

abstract class PokemonCacheDataSource {
  Future<void> addFavoritePokemon(PokemonModel pokemonModel);

  Future<void> removeFavoritePokemon(PokemonModel pokemonModel);

  Future<List<PokemonModel>> getFavoritePokemonList();
}
