import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

abstract class AddFavoritePokemonUseCase {
  Future<void> call(PokemonModel pokemonModel);
}

class AddFavoritePokemonUseCaseImpl implements AddFavoritePokemonUseCase {
  AddFavoritePokemonUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<void> call(PokemonModel pokemonModel) async =>
      _pokemonRepository.addFavoritePokemon(pokemonModel);
}
