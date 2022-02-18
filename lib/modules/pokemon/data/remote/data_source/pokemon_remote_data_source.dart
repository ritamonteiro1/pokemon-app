import '../../../domain/model/pokemon/pokemon_model.dart';

mixin PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemonList();

  Future<PokemonModel> getPokemonTyped(String typedPokemon);
}
