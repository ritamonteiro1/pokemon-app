import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

mixin GetFavoritePokemonListUseCase {
  Future<List<PokemonModel>> call();
}

class GetFavoritePokemonListUseCaseImpl
    implements GetFavoritePokemonListUseCase {
  GetFavoritePokemonListUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<List<PokemonModel>> call() async =>
      _pokemonRepository.getFavoritePokemonList();
}
