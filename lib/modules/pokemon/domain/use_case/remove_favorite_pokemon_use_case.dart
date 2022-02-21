import '../model/pokemon/pokemon_model.dart';

mixin RemoveFavoritePokemonUseCase {
  Future<void> call(PokemonModel pokemonModel);
}
