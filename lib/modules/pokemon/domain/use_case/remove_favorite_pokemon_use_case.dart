import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

abstract class RemoveFavoritePokemonUseCase {
  Future<void> call(PokemonModel pokemonModel);
}

class RemoveFavoritePokemonUseCaseImpl implements RemoveFavoritePokemonUseCase {
  RemoveFavoritePokemonUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<void> call(PokemonModel pokemonModel) async =>
      _pokemonRepository.removeFavoritePokemon(pokemonModel);
}
