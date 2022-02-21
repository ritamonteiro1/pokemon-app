import '../model/pokemon/pokemon_model.dart';

mixin PokemonRepository {
  Future<List<PokemonModel>> getPokemonList();

  Future<PokemonModel> getPokemonTyped(String typedPokemon);

  Future<void> addFavoritePokemon(PokemonModel pokemonModel);

  Future<void> removeFavoritePokemon(PokemonModel pokemonModel);

  Future<List<PokemonModel>> getFavoritePokemonList();
}
