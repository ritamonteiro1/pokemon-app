import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';
import 'get_favorite_pokemon_list_use_case.dart';

class GetFavoritePokemonListUseCaseImpl
    implements GetFavoritePokemonListUseCase {
  GetFavoritePokemonListUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<List<PokemonModel>> call() {
    throw UnimplementedError();
  }
}
