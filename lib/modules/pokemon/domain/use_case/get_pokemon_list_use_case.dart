import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

mixin GetPokemonListUseCase {
  Future<List<PokemonModel>> call();
}

class GetPokemonListUseCaseImpl implements GetPokemonListUseCase {
  GetPokemonListUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<List<PokemonModel>> call() async =>
      _pokemonRepository.getPokemonList();
}
