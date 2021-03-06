import '../exception/empty_favorite_pokemon_list_exception.dart';
import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

abstract class GetFavoritePokemonListUseCase {
  Future<List<PokemonModel>> call();
}

class GetFavoritePokemonListUseCaseImpl
    implements GetFavoritePokemonListUseCase {
  GetFavoritePokemonListUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<List<PokemonModel>> call() async {
    final favoritePokemonList =
        await _pokemonRepository.getFavoritePokemonList();
    if (favoritePokemonList.isNotEmpty) {
      return favoritePokemonList;
    } else {
      throw EmptyFavoritePokemonListException();
    }
  }
}
