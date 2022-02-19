import '../model/pokemon/pokemon_model.dart';

mixin GetPokemonTypedUseCase {
  Future<PokemonModel> call(String typedPokemon);
}
