import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_list_use_case.dart';

class GetPokemonListUseCaseImpl implements GetPokemonListUseCase {
  GetPokemonListUseCaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<List<PokemonModel>> getPokemonList() =>
      _pokemonRepository.getPokemonList();
}
