import '../model/pokemon/pokemon_model.dart';

mixin PokemonRepository {
  Future<List<PokemonModel>> getPokemonList();
}
