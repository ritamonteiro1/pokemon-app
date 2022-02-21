import '../model/pokemon/pokemon_model.dart';

mixin GetFavoritePokemonListUseCase {
  Future<List<PokemonModel>> call();
}
