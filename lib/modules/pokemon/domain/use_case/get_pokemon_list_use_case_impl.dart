import '../model/pokemon/pokemon_model.dart';
import '../repository/pokemon_repository.dart';
import 'get_pokemon_list_use_case.dart';

class GetPokemonListUseCaseImpl implements GetPokemonListUseCase {
  GetPokemonListUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<List<PokemonModel>> call() async =>
      _pokemonRepository.getPokemonList();
}
