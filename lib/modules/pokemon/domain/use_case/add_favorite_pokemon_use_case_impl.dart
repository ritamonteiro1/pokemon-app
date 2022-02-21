import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';

import 'add_favorite_pokemon_use_case.dart';

class AddFavoritePokemonUseCaseImpl implements AddFavoritePokemonUseCase {
  AddFavoritePokemonUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<void> call(PokemonModel pokemonModel) {
    throw UnimplementedError();
  }
}
