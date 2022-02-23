import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

abstract class GetPokemonTypedUseCase {
  Future<PokemonModel> call(String typedPokemon);
}

class GetPokemonTypedUseCaseImpl implements GetPokemonTypedUseCase {
  GetPokemonTypedUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<PokemonModel> call(String typedPokemon) async =>
      _pokemonRepository.getPokemonTyped(typedPokemon);
}
