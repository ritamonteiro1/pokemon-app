import '../model/pokemon/pokemon_model.dart';

mixin AddFavoritePokemonUseCase {
  Future<void> call(PokemonModel pokemonModel);
}
