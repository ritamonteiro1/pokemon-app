import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

import 'remove_favorite_pokemon_use_case.dart';

class RemoveFavoritePokemonUseCaseImpl implements RemoveFavoritePokemonUseCase {
  RemoveFavoritePokemonUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<void> call(PokemonModel pokemonModel) async =>
      _pokemonRepository.removeFavoritePokemon(pokemonModel);
}
