import '../model/pokemon/pokemon_model.dart';

mixin GetPokemonListUseCase {
  Future<List<PokemonModel>> call();
}
