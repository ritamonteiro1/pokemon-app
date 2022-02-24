import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

abstract class VerifyIfPokemonIsFavoriteUseCase {
  Future<bool> call(PokemonModel pokemonModel);
}

class VerifyIfPokemonIsFavoriteUseCaseImpl
    implements VerifyIfPokemonIsFavoriteUseCase {
  VerifyIfPokemonIsFavoriteUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<bool> call(PokemonModel pokemonModel) {
    throw UnimplementedError();
  }
}
